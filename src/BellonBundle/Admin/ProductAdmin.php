<?php

namespace BellonBundle\Admin;

use Sonata\AdminBundle\Admin\Admin;
use Sonata\AdminBundle\Datagrid\DatagridMapper;
use Sonata\AdminBundle\Datagrid\ListMapper;
use Sonata\AdminBundle\Form\FormMapper;
use Sonata\AdminBundle\Show\ShowMapper;

class ProductAdmin extends Admin
{
    /**
     * @param DatagridMapper $datagridMapper
     */
    protected function configureDatagridFilters(DatagridMapper $datagridMapper)
    {
        $datagridMapper
            ->add('name')
            ->add('shortDescription')
            ->add('productCategory')
            ->add('minCost')
            ->add('maxCost')
        ;
    }

    /**
     * @param ListMapper $listMapper
     */
    protected function configureListFields(ListMapper $listMapper)
    {
        $listMapper
            ->add('name')
            ->add('productCategory')
            ->add('image', 'string', ['template' => 'BellonBundle:Preview:product.preview.list.html.twig'])
            ->add('shortDescription')
            ->add('_action', 'actions', array(
                'actions' => array(
                    'show' => array(),
                    'edit' => array(),
                    'delete' => array(),
                )
            ))
        ;
    }

    /**
     * @param FormMapper $formMapper
     */
    protected function configureFormFields(FormMapper $formMapper)
    {
        $formMapper
            ->add('name')
            ->add('productCategory')
            ->add('minCost')
            ->add('maxCost')
            ->add('image','itm_image_preview', ['required' => false])
            ->add('shortDescription')
            ->add('description', 'ckeditor',array(
                'config_name' => 'default',
            ))

        ;
    }

    /**
     * @param ShowMapper $showMapper
     */
    protected function configureShowFields(ShowMapper $showMapper)
    {
        $showMapper
            ->add('id')
            ->add('name')
            ->add('productCategory')
            ->add('minCost')
            ->add('maxCost')
            ->add('image', 'string', ['template' => 'BellonBundle:Preview:product.preview.show.html.twig'])
            ->add('shortDescription')
            ->add('description', null, ['safe' => true])
        ;
    }
}
