<?php

namespace BellonBundle\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Template;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\HttpFoundation\Request;

class DefaultController extends Controller
{
    /**
     * @Route("/", name="index")
     * @Template()
     */
    public function indexAction()
    {
        $categories = $this->getDoctrine()->getRepository('BellonBundle:Category')->findAll();

        return [
            'categories' => $categories,
        ];
    }

    /**
     * @Route("/about", name="about")
     * @Template()
     */
    public function aboutAction()
    {
        $about = $this->getDoctrine()->getRepository('BellonBundle:Config')->getConfigByKeyValue('ABOUT');

        return [
            'about' => $about,
        ];
    }

    /**
     * @Route("/contacts", name="contacts")
     * @Template()
     */
    public function contactsAction(Request $request)
    {
        $address = $this->getDoctrine()->getRepository('BellonBundle:Config')->getConfigByKeyValue('ADDRESS');
        $phone1 = $this->getDoctrine()->getRepository('BellonBundle:Config')->getConfigByKeyValue('PHONE_1');
        $phone2 = $this->getDoctrine()->getRepository('BellonBundle:Config')->getConfigByKeyValue('PHONE_2');
        $email = $this->getDoctrine()->getRepository('BellonBundle:Config')->getConfigByKeyValue('EMAIL');

        $mail_to = $this->getDoctrine()
            ->getRepository('BellonBundle:Config')
            ->getConfigByKeyValue('EMAIL_TO');

        if ($request->getMethod() == 'POST')
        {
            $message = $request->get('message');

            $mailer = $this->get('swiftmailer.mailer.default');
            $message = \Swift_Message::newInstance()
                ->setSubject($request->get('subject'))
                ->setFrom($request->get('email'))
                ->setTo(trim(strip_tags($mail_to->getValue())))
                ->setBody($message);
            ;
            $mailer->send($message);

            $this->get('session')->getFlashBag()->set('notice', 'Сообщение отправлено успешно');
        }

        return [
            'address' => $address,
            'phone1' => $phone1,
            'phone2' => $phone2,
            'email'  => $email,
        ];
    }

    /**
     * @Route("/category-product/{slug}", name="category_products")
     * @Template()
     */
    public function categoryProductsAction($slug)
    {
        $category = $this->getDoctrine()->getRepository('BellonBundle:Category')->findOneBy(['slug' => $slug]);
        $categoryProducts = $this->getDoctrine()->getRepository('BellonBundle:ProductCategory')->getProductCategoryByCategorySlug($slug);
        $products = $this->getDoctrine()->getRepository('BellonBundle:Product')->getProductByCategorySlug($slug);

        return [
            'categoryProducts' => $categoryProducts,
            'category'         => $category,
            'products'         => $products,
        ];
    }

    /**
     * @Route("/specific-products", name="specific_products")
     */
    public function specificProductsAction(Request $request)
    {
        $slug = $request->get('slug');
        $stringToArray = explode(',', $slug);
        if(count($stringToArray) > 1){
            $category = $this->getDoctrine()->getRepository('BellonBundle:Category')->findOneBy(['slug' => $stringToArray[0]]);
            $products = $this->getDoctrine()->getRepository('BellonBundle:Product')->getProductByCategorySlug($category->getSlug());
        }
        else{
            $products = $this->getDoctrine()->getRepository('BellonBundle:Product')->getProductByProductCategorySlug($stringToArray[0]);
        }

        return new JsonResponse($products);
    }

    /**
     * @Route("/product/{slug}", name="product")
     * @Template()
     */
    public function productAction($slug)
    {
        $product = $this->getDoctrine()->getRepository('BellonBundle:Product')->findOneBy(['slug' => $slug]);

        return [
            'product' => $product
        ];
    }

    /**
     * @Template()
     */
    public function footerAction()
    {
        $footerCopyright = $this->getDoctrine()->getRepository('BellonBundle:Config')->getConfigByKeyValue('FOOTER_COPYRIGHT');
        $footerDescription = $this->getDoctrine()->getRepository('BellonBundle:Config')->getConfigByKeyValue('FOOTER_DESCRIPTION');
        $address = $this->getDoctrine()->getRepository('BellonBundle:Config')->getConfigByKeyValue('ADDRESS');

        return [
            'footerCopyright' => $footerCopyright,
            'footerDescription' => $footerDescription,
            'address' => $address,
        ];
    }
    /**
     * @Template()
     */
    public function menuAction()
    {
        $categories = $this->getDoctrine()->getRepository('BellonBundle:Category')->findAll();

        return [
            'categories' => $categories,
        ];
    }
}
