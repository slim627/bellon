<?php

namespace BellonBundle\Entity;

use Doctrine\ORM\Mapping as ORM;
use Gedmo\Mapping\Annotation as Gedmo;
use Symfony\Component\DependencyInjection\ContainerAwareInterface;
use Symfony\Component\DependencyInjection\ContainerInterface;

/**
 * ProductCategory
 *
 * @ORM\Table(name="product")
 * @ORM\Entity(repositoryClass="BellonBundle\Entity\Repository\ProductRepository")
 */
class Product implements \JsonSerializable, ContainerAwareInterface
{
    /**
     * @var integer
     *
     * @ORM\Column(name="id", type="integer")
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="AUTO")
     */
    private $id;

    /**
     * @var string
     *
     * @ORM\Column(name="name", type="string", nullable=false)
     */
    private $name;

    /**
     * @Gedmo\Slug(fields={"name"})
     * @ORM\Column(length=128, unique=true)
     */
    private $slug;

    /**
     * @var string
     *
     * @ORM\Column(name="image", type="string", nullable=true)
     */
    private $image;

    /**
     * @var string
     *
     * @ORM\Column(name="short_description", type="string", nullable=true, length=100)
     */
    private $shortDescription;

    /**
     * @var string
     *
     * @ORM\Column(name="description", type="text", nullable=true)
     */
    private $description;

    /**
     * @var string
     *
     * @ORM\Column(name="min_cost", type="string", nullable=true)
     */
    private $minCost;

    /**
     * @var string
     *
     * @ORM\Column(name="max_cost", type="string", nullable=true)
     */
    private $maxCost;

    /**
     * @ORM\ManyToOne(targetEntity="BellonBundle\Entity\ProductCategory", inversedBy="products")
     */
    private $productCategory;

    /**
     * @var string
     * @ORM\Column(name="meta_title", type="text", nullable=true)
     */
    private $metaTitle;

    /**
     * @var string
     * @ORM\Column(name="meta_description", type="text", nullable=true)
     */
    private $metaDescription;

    /**
     * @var string
     * @ORM\Column(name="meta_keywords", type="text", nullable=true)
     */
    private $metaKeywords;

    public function __toString()
    {
        return $this->name ? $this->name : 'Создание';
    }

    /**
     * Get id
     *
     * @return integer 
     */
    public function getId()
    {
        return $this->id;
    }

    /**
     * Set name
     *
     * @param string $name
     * @return Product
     */
    public function setName($name)
    {
        $this->name = $name;

        return $this;
    }

    /**
     * Get name
     *
     * @return string 
     */
    public function getName()
    {
        return $this->name;
    }

    /**
     * Set image
     *
     * @param string $image
     * @return Product
     */
    public function setImage($image)
    {
        $this->image = $image;

        return $this;
    }

    /**
     * Get image
     *
     * @return string 
     */
    public function getImage()
    {
        return $this->image;
    }

    /**
     * Set shortDescription
     *
     * @param string $shortDescription
     * @return Product
     */
    public function setShortDescription($shortDescription)
    {
        $this->shortDescription = $shortDescription;

        return $this;
    }

    /**
     * Get shortDescription
     *
     * @return string 
     */
    public function getShortDescription()
    {
        return $this->shortDescription;
    }

    /**
     * Set description
     *
     * @param string $description
     * @return Product
     */
    public function setDescription($description)
    {
        $this->description = $description;

        return $this;
    }

    /**
     * Get description
     *
     * @return string 
     */
    public function getDescription()
    {
        return $this->description;
    }

    /**
     * Set category
     *
     * @param \BellonBundle\Entity\Category $category
     * @return Product
     */
    public function setCategory(\BellonBundle\Entity\Category $category = null)
    {
        $this->category = $category;

        return $this;
    }

    /**
     * Get category
     *
     * @return \BellonBundle\Entity\Category 
     */
    public function getCategory()
    {
        return $this->category;
    }

    /**
     * Set slug
     *
     * @param string $slug
     * @return Product
     */
    public function setSlug($slug)
    {
        $this->slug = $slug;

        return $this;
    }

    /**
     * Get slug
     *
     * @return string 
     */
    public function getSlug()
    {
        return $this->slug;
    }

    /**
     * Set text
     *
     * @param string $text
     * @return Product
     */
    public function setText($text)
    {
        $this->text = $text;

        return $this;
    }

    /**
     * Get text
     *
     * @return string 
     */
    public function getText()
    {
        return $this->text;
    }

    /**
     * Set productCategory
     *
     * @param \BellonBundle\Entity\ProductCategory $productCategory
     * @return Product
     */
    public function setProductCategory(\BellonBundle\Entity\ProductCategory $productCategory = null)
    {
        $this->productCategory = $productCategory;

        return $this;
    }

    /**
     * Get productCategory
     *
     * @return \BellonBundle\Entity\ProductCategory 
     */
    public function getProductCategory()
    {
        return $this->productCategory;
    }

    private $container = null;

    public function setContainer(ContainerInterface $container = null)
    {
        $this->container = $container;
    }

    public function JsonSerialize()
    {
        $twigExtension = $this->container->get('itm.image.preview.twig_extension');
        $pathToImage = $twigExtension->resolvePath($this, 'image');
        $cacheManager = $this->container->get('liip_imagine.cache.manager');
        $pathToCropImage = $cacheManager->getBrowserPath($pathToImage, 'product_main');

        return [
            'img'              => $pathToCropImage,
            'name'             => $this->getName(),
            'shortDescription' => $this->getShortDescription(),
            'slug'             => $this->getSlug(),
        ];
    }

    /**
     * Set minCost
     *
     * @param string $minCost
     * @return Product
     */
    public function setMinCost($minCost)
    {
        $this->minCost = $minCost;

        return $this;
    }

    /**
     * Get minCost
     *
     * @return string 
     */
    public function getMinCost()
    {
        return $this->minCost;
    }

    /**
     * Set maxCost
     *
     * @param string $maxCost
     * @return Product
     */
    public function setMaxCost($maxCost)
    {
        $this->maxCost = $maxCost;

        return $this;
    }

    /**
     * Get maxCost
     *
     * @return string 
     */
    public function getMaxCost()
    {
        return $this->maxCost;
    }

    /**
     * Set metaTitle
     *
     * @param string $metaTitle
     * @return Product
     */
    public function setMetaTitle($metaTitle)
    {
        $this->metaTitle = $metaTitle;

        return $this;
    }

    /**
     * Get metaTitle
     *
     * @return string 
     */
    public function getMetaTitle()
    {
        return $this->metaTitle;
    }

    /**
     * Set metaDescription
     *
     * @param string $metaDescription
     * @return Product
     */
    public function setMetaDescription($metaDescription)
    {
        $this->metaDescription = $metaDescription;

        return $this;
    }

    /**
     * Get metaDescription
     *
     * @return string 
     */
    public function getMetaDescription()
    {
        return $this->metaDescription;
    }

    /**
     * Set metaKeywords
     *
     * @param string $metaKeywords
     * @return Product
     */
    public function setMetaKeywords($metaKeywords)
    {
        $this->metaKeywords = $metaKeywords;

        return $this;
    }

    /**
     * Get metaKeywords
     *
     * @return string 
     */
    public function getMetaKeywords()
    {
        return $this->metaKeywords;
    }
}
