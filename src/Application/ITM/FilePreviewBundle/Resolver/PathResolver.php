<?php

namespace Application\ITM\FilePreviewBundle\Resolver;

use Doctrine\ORM\EntityManagerInterface;
use ITM\FilePreviewBundle\Resolver\PathResolver as BaseResolver;
use Symfony\Component\DependencyInjection\ContainerInterface;
use Symfony\Component\PropertyAccess\PropertyAccess;

/**
 * Class PathResolver
 * @package Application\ITM\FilePreviewBundle\Resolver
 */
class PathResolver extends BaseResolver
{
    /**
     * @var EntityManagerInterface
     */
    protected $entityManager;

    /**
     * @param ContainerInterface $container
     * @param $entityManager
     */
    public function __construct(ContainerInterface $container, EntityManagerInterface $entityManager)
    {
        parent::__construct($container);

        $this->entityManager = $entityManager;
    }

    /**
     * @param $entity
     * @param $field
     * @param bool $relative
     * @return string
     */
    public function getPath($entity, $field, $relative = false)
    {
        $this->refreshEntityField($entity, $field);

        return parent::getPath($entity, $field, $relative);
    }

    /**
     * @param $entity
     * @param $field
     * @return string
     */
    public function getUrl($entity, $field)
    {
        $this->refreshEntityField($entity, $field);

        return parent::getUrl($entity, $field);
    }

    /**
     * @param $entity
     * @param $field
     * @return null|object
     * @throws \Doctrine\ORM\ORMException
     * @throws \Doctrine\ORM\OptimisticLockException
     * @throws \Doctrine\ORM\TransactionRequiredException
     */
    protected function refreshEntityField($entity, $field)
    {
        $accessor = PropertyAccess::createPropertyAccessor();
        if($accessor->isReadable($entity, $field)) {

            $field = $accessor->getValue($entity, $field);
            if(empty($field) && $this->entityManager->contains($entity)) {

                $this->entityManager->refresh($entity);
            } // if
        } // if

        return $this;
    }
}