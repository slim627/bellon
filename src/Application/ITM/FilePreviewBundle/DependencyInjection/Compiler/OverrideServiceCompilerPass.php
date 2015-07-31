<?php

namespace Application\ITM\FilePreviewBundle\DependencyInjection\Compiler;

use Symfony\Component\DependencyInjection\Compiler\CompilerPassInterface;
use Symfony\Component\DependencyInjection\ContainerBuilder;
use Symfony\Component\DependencyInjection\Reference;

/**
 * Class OverrideServiceCompilerPass
 * @package Application\ITM\FilePreviewBundle\DependencyInjection\Compiler
 */
class OverrideServiceCompilerPass implements CompilerPassInterface
{
    /**
     * @param ContainerBuilder $container
     */
    public function process(ContainerBuilder $container)
    {
        if ($container->hasDefinition('itm.file.preview.subscriber')) {

            $parameters = $container->getParameter('ITMFilePreviewBundleConfiguration');
            $container->getDefinition('itm.file.preview.subscriber')
                ->setClass('Application\\ITM\\FilePreviewBundle\\EventListener\\FileSubscriber')
                ->addMethodCall('setOptions', array($parameters))
                ->addMethodCall('setContainer', array(new Reference('service_container')))
            ;
        }

        if ($container->hasDefinition('itm.file.preview.path.resolver')) {

            $container->getDefinition('itm.file.preview.path.resolver')
                ->setClass('Application\\ITM\\FilePreviewBundle\\Resolver\\PathResolver')
                ->addArgument(new Reference('doctrine.orm.default_entity_manager'))
            ;
        }
    }
}