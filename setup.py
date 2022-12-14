from distutils.core import setup
from setuptools import find_packages

setup(name="nlpcore",
      version="0.0.2",
      description="Tools for NLP research",
      license="MIT",
      author="Henry Scheible",
      author_email="henry.scheible@gmail.com",
      url="https://github.com/henryscheible/nlp-core",
      install_requires=[
          'torch',
          'transformers[sentencepiece]',
          'datasets',
          'evaluate',
          'sklearn',
          'captum'
      ],
      packages=find_packages()
)
