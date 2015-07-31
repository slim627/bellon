<?php
namespace BellonBundle\DataFixtures\ORM;

use Doctrine\Common\DataFixtures\FixtureInterface;
use Doctrine\Common\Persistence\ObjectManager;
use BellonBundle\Entity\Config;
use Application\Sonata\UserBundle\Entity\User;

class LoadConfigData implements FixtureInterface
{
    /**
    * {@inheritDoc}
    */
    public function load(ObjectManager $manager)
    {
        $config = new Config();
        $config->setName('Footer copyright');
        $config->setValue('© 2015 Bellon Company');
        $config->setKeyValue('FOOTER_COPYRIGHT');
        $manager->persist($config);

        $config = new Config();
        $config->setName('Footer описание');
        $config->setValue('By Alexey');
        $config->setKeyValue('FOOTER_DESCRIPTION');
        $manager->persist($config);

        $config = new Config();
        $config->setName('Адресс');
        $config->setValue('ул. Чапаева 3 офис 303	Минск Беларусь');
        $config->setKeyValue('ADDRESS');
        $manager->persist($config);

        $config = new Config();
        $config->setName('Телефон');
        $config->setValue('(123) 456-7890');
        $config->setKeyValue('PHONE_1');
        $manager->persist($config);

        $config = new Config();
        $config->setName('Телефон');
        $config->setValue('(123) 456-7890');
        $config->setKeyValue('PHONE_2');
        $manager->persist($config);

        $config = new Config();
        $config->setName('email');
        $config->setValue('bellon.minsk@gmail.com');
        $config->setKeyValue('EMAIL');
        $manager->persist($config);

        $config = new Config();
        $config->setName('Куда будет отправлено сообщение');
        $config->setValue('sliml2@mail.ru');
        $config->setKeyValue('EMAIL_TO');
        $manager->persist($config);

        $config = new Config();
        $config->setName('Страница о нас');
        $config->setValue('');
        $config->setKeyValue('ABOUT');
        $manager->persist($config);

        $User = new User();
        $User->setEmail("admin@admin.by");
        $User->setPlainPassword("admin");
        $User->setSuperAdmin(true);
        $User->setUsername("admin");
        $User->setEnabled(true);

        $manager->persist($User);
        $manager->flush();
    }
}