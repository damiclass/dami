<?php
namespace Home\Widget;
use Home\Action\BaseAction;
/**
 * ============================================================================
 * WSTMall开源商城
 * 官网地址:http://www.wstmall.net
 * 联系QQ:707563272
 * ============================================================================
 * 
 */
class GoodsWidget extends BaseAction {
	/**
	 * 查看商品历史记录
	 */
	public function getViewGoods(){
		$m = D('Home/Goods');
		$goodslist = $m->getViewGoods();
		$this->assign("goodslist",$goodslist);
		$this->display("widget/view_history");
	}
	
	/**
	 * 热销排名
	 */
	public function getHotGoods($shopId){
		$m = D('Home/Goods');
		$hotgoods = $m->getHotGoods((int)$shopId);
		$this->assign("hotgoods",$hotgoods);
		$this->display("widget/hot_goods");
	}
	
}