<?php
/**
 * CMS-IDE Visual CMS
 *
 * @category   CSSController
 * @package    CMS-IDE
 *  Copyright (C) 2010-2021  Nebojsa Tomic
 *  
 *  This file is part of CMS-IDE.
 *     
 *  CMS-IDE is free software; you can redistribute it and/or
 *  modify it under the terms of the GNU Lesser General Public
 *  License as published by the Free Software Foundation; either
 *  version 3 of the License, or (at your option) any later version.
 *
 *  CMS-IDE is distributed in the hope that it will be useful,
 *  but WITHOUT ANY WARRANTY; without even the implied warranty of
 *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 *  Lesser General Public License for more details.
 *
 *  You should have received a copy of the GNU Lesser General Public
 *  License along with this library; if not, write to the Free Software
 *  Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA
 *
 * 
 * 
 */
 
require_once 'NeTFramework/NetActionController.php';

class CSSController extends NetActionController
{
    public function init()
    {

    }

    public function indexAction()
    {
        $this->_helper->layout()->disableLayout();
        $this->_helper->viewRenderer->setNoRender();
        $values = $this->_request->getParams();
        print_r($values);
        $this->view->headStyle()->appendStyle($this->_host . 'public/' . $values['controller'] . "/" . $values['id'] , $type = 'text/css');

    }
}