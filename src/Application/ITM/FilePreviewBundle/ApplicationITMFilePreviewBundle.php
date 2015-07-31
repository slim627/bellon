<?php

namespace Application\ITM\FilePreviewBundle;

use Symfony\Component\DependencyInjection\ContainerBuilder;
use Symfony\Component\HttpKernel\Bundle\Bundle;
use Application\ITM\FilePreviewBundle\DependencyInjection\Compiler;
/**
 * Class ApplicationITMFilePreviewBundle
 * @package Application\ITM\FilePreviewBundle
 */
class ApplicationITMFilePreviewBundle extends Bundle
{
    /**
     * @param ContainerBuilder $container
     */
    public function build(ContainerBuilder $container)
    {
        $container->addCompilerPass(new Compiler\OverrideServiceCompilerPass());
    }

    /**
     * @return string
     */
    public function getParent()
    {
        return 'ITMFilePreviewBundle';
    }
}