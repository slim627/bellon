<?php

namespace Application\ITM\FilePreviewBundle\EventListener;

use Doctrine\Bundle\DoctrineBundle\Registry as Doctrine;
use Doctrine\ORM\Event\LifecycleEventArgs;
use Symfony\Component\DependencyInjection\ContainerAwareInterface;
use Symfony\Component\DependencyInjection\ContainerInterface;
use Symfony\Component\PropertyAccess\PropertyAccess;
use ITM\FilePreviewBundle\EventListener\FileSubscriber as BaseSubscriber;
use Application\ITM\FilePreviewBundle\File\File;
/**
 * Class FileSubscriber
 * @package Application\ITM\FilePreviewBundle\EventListener
 */
class FileSubscriber extends BaseSubscriber implements ContainerAwareInterface
{
    /**
     * @var array
     */
    protected $options;

    /**
     * @var ContainerInterface
     */
    protected $container;

    /**
     * @param LifecycleEventArgs $args
     */
    public function postLoad(LifecycleEventArgs $args)
    {
        parent::postLoad($args);

        $doctrine = $this->container->get('doctrine');
        $accessor = PropertyAccess::createPropertyAccessor();
        $curEntity = $args->getEntity();

        foreach( $this->options['entities'] as $bundleName => $bundle ) {

            foreach( $bundle['bundle'] as $entityName => $entity ) {

                $entityClass = get_class($curEntity);
                if( $entityClass == $doctrine->getAliasNamespace($bundleName).'\\'. $entityName) {

                    foreach( $entity['entity'] as $fieldName => $field ) {

                        if($filename = $accessor->getValue($curEntity, $fieldName)) {

                            $pathResolver = $this->container->get('itm.file.preview.path.resolver');
                            $accessor->setValue($curEntity, $fieldName, new File($pathResolver->getPath($curEntity, $filename)));
                        }
                    } // foreach
                } // if
            } // foreach
        } // foreach
    }

    /**
     * @param array $options
     * @return $this
     */
    public function setOptions($options = array())
    {
        $this->options = $options;

        return $this;
    }

    /**
     * @param ContainerInterface $container
     * @return $this
     */
    public function setContainer(ContainerInterface $container = null)
    {
        $this->container = $container;

        return $this;
    }
}