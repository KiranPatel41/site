/**
 * @license Copyright (c) 2003-2017, CKSource - Frederico Knabben. All rights reserved.
 * For licensing, see LICENSE.md or http://ckeditor.com/license
 */

CKEDITOR.editorConfig = function( config ) {
	// Define changes to default configuration here. For example:
	// config.language = 'fr';
	// config.uiColor = '#AADC6E';
    //CKEDITOR.dtd.$removeEmpty['i'] = false;
    config.protectedSource.push(/<i class[\s\S]*?\>/g);
    config.protectedSource.push(/<\/i>/g);
	config.allowedContent = true;
	config.extraAllowedContent = 'div';
	config.extraPlugins = 'imagerotate';

};
