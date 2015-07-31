<?php

namespace Application\ITM\FilePreviewBundle\DependencyInjection;

use Symfony\Component\Config\FileLocator;
use Symfony\Component\DependencyInjection\ContainerBuilder;
use Symfony\Component\DependencyInjection\Loader\YamlFileLoader;
use Symfony\Component\DependencyInjection\Reference;
use Symfony\Component\HttpKernel\DependencyInjection\Extension;

/**
 * Class ApplicationITMFilePreviewExtension
 * @package Application\Sonata\AdminBundle\DependencyInjection
 */
class ApplicationITMFilePreviewExtension extends Extension
{
    /**
     * @param array $config
     * @param ContainerBuilder $container
     */
    public function load(array $config, ContainerBuilder $container)
    {

    }
}