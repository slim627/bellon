<?php

namespace Application\ITM\FilePreviewBundle\File;

use Symfony\Component\HttpFoundation\File\File as BaseFile;

/**
 * Class File
 * @package Application\ITM\FilePreviewBundle\File
 */
class File extends BaseFile
{
    /**
     * @return string
     */
    public function __toString()
    {
        return $this->getFilename();
    }
}