import argparse
from cStringIO import StringIO
import requests
from lxml import html
from PIL import Image
import yaml

def main(url):
	page = requests.get(url)
	tree = html.fromstring(page.content)
	gallery = []
	for slide in tree.cssselect('div.slick-slideshow figure'):
		src = slide.cssselect('img')[0].get('data-lazy')
		img_size = Image.open(StringIO(requests.get(src).content)).size
		caption = slide.xpath('figcaption/text()[normalize-space()]')
		byline = slide.xpath('figcaption/span[@class="img-credit"]/text()')
		gallery.append({
			'src': src,
			'caption': caption[0].strip() if caption else '',
			'byline': byline[0].strip() if byline else '',
			'width': img_size[0],
			'height': img_size[1]
		})
	print yaml.dump(gallery, width=100000)


if __name__ == '__main__':
	parser = argparse.ArgumentParser()
	parser.add_argument(
		'--url',
		required=True,
		help="URL to pull main slideshow photos from")

	args = parser.parse_args()
	main(args.url)