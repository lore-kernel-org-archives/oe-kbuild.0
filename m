Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 097638460
	for <oe-kbuild@lists.linux.dev>; Sun, 27 Oct 2024 06:23:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730010197; cv=none; b=HvW5dgGyTXgHcWDS/wr0AyYAva4rWcBsDiK9LS6tzlpa60iz4hrvyxNn//+pxqONvah4A1A71WLiKQoqMjhZsQdivL4sjC0V8yR4K7YZo87VnFACvFRvmD9a6hA/RE3Y2RZC5LZ7UWhFMZwESgDRcHkiL/OjHJILWMEtv8OdNEU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730010197; c=relaxed/simple;
	bh=jEt52zMFtMSH/an8uozcQoY7NqyuhjcnDEFpT651+D4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=arEZ9Zhjdpl+jxyllBmck/vnpfTf2ADCsr0eQYsRyi+2HL9/jhdu9q3ARM4mJzgqvQlxNoblLSIY/pSWDR9GIlBxHbVmyv4CBH/cpbQRw1wZvS4QNDw7Oqfti7xVIxZpxEnR7W0d6vWuRveO6NmzuXB0PiecS0bseebM8vkNriU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iUif4xhF; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iUif4xhF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730010194; x=1761546194;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jEt52zMFtMSH/an8uozcQoY7NqyuhjcnDEFpT651+D4=;
  b=iUif4xhFqdcG9ajNvgIhQAIXoNt1bszUAbci5KF3X+BcISh59KVSFY7z
   39PA59BB/XMu9yyYAjjqFiBRsavRh7ULgeeLgHbeZ27MJzGERYdV8kCWy
   NJLE3tmty5CSkZP+ffuaZcV1yKkXFk1rNJlUnPHEo02caovMYRbje2ez4
   EQIkAZLSzdtOeGLBg0GCo48SDjxRLSP4DWqvu37LBHvqA4DoxLdZBNVgI
   2PpIaHLUE2fYB8qaMsLbKuou8yAPnPRS7r/vM3X+aXULx3TeIjbxQBoGH
   oH+P0+sAkmmqCehbEJ1R0vdWE8jXL4Vr0WJk0sSYnsCDutoVVXhMp4Sym
   Q==;
X-CSE-ConnectionGUID: Sx5JUxo3Rxq3MNtWfHgCDQ==
X-CSE-MsgGUID: ucBbT8+GT1WcGo6QRATP6w==
X-IronPort-AV: E=McAfee;i="6700,10204,11237"; a="29846727"
X-IronPort-AV: E=Sophos;i="6.11,236,1725346800"; 
   d="scan'208";a="29846727"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2024 23:23:13 -0700
X-CSE-ConnectionGUID: W2kIAjTQTgCaSdMrqAX+6Q==
X-CSE-MsgGUID: oD4QDb3OSS2Kl0uk22yg0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,236,1725346800"; 
   d="scan'208";a="82129728"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 26 Oct 2024 23:23:12 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t4wg9-000aQq-1y;
	Sun, 27 Oct 2024 06:23:09 +0000
Date: Sun, 27 Oct 2024 14:22:24 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH] pinctrl: mediatek: add eint new design for mt8196
Message-ID: <202410271443.Oun7sJxS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20241025031814.21442-1-ot_chhao.chang@mediatek.com>
References: <20241025031814.21442-1-ot_chhao.chang@mediatek.com>
TO: chang hao <ot_chhao.chang@mediatek.com>
TO: matthias.bgg@gmail.com
TO: angelogioacchino.delregno@collabora.com
TO: sean.wang@kernel.org
TO: linus.walleij@linaro.org
CC: linux-mediatek@lists.infradead.org
CC: linux-gpio@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: linux-arm-kernel@lists.infradead.org
CC: Chhao Chang <ot_chhao.chang@mediatek.com>

Hi chang,

kernel test robot noticed the following build warnings:

[auto build test WARNING on linusw-pinctrl/devel]
[also build test WARNING on linusw-pinctrl/for-next linus/master v6.12-rc4 next-20241025]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/chang-hao/pinctrl-mediatek-add-eint-new-design-for-mt8196/20241025-111952
base:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git devel
patch link:    https://lore.kernel.org/r/20241025031814.21442-1-ot_chhao.chang%40mediatek.com
patch subject: [PATCH] pinctrl: mediatek: add eint new design for mt8196
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: arm-randconfig-r071-20241027 (https://download.01.org/0day-ci/archive/20241027/202410271443.Oun7sJxS-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202410271443.Oun7sJxS-lkp@intel.com/

smatch warnings:
drivers/pinctrl/mediatek/mtk-eint.c:116 mtk_eint_get_stat() error: uninitialized symbol 'index'.
drivers/pinctrl/mediatek/mtk-eint.c:117 mtk_eint_get_mask() error: uninitialized symbol 'index'.
drivers/pinctrl/mediatek/mtk-eint.c:118 mtk_eint_get_sens() error: uninitialized symbol 'index'.
drivers/pinctrl/mediatek/mtk-eint.c:119 mtk_eint_get_pol() error: uninitialized symbol 'index'.
drivers/pinctrl/mediatek/mtk-eint.c:120 mtk_eint_get_dom_en() error: uninitialized symbol 'index'.
drivers/pinctrl/mediatek/mtk-eint.c:121 mtk_eint_get_event() error: uninitialized symbol 'index'.
drivers/pinctrl/mediatek/mtk-eint.c:122 mtk_eint_get_raw_stat() error: uninitialized symbol 'index'.
drivers/pinctrl/mediatek/mtk-eint.c:154 mtk_eint_can_en_debounce() error: uninitialized symbol 'index'.
drivers/pinctrl/mediatek/mtk-eint.c:219 mtk_eint_mask() error: uninitialized symbol 'index'.
drivers/pinctrl/mediatek/mtk-eint.c:239 mtk_eint_unmask() error: uninitialized symbol 'index'.
drivers/pinctrl/mediatek/mtk-eint.c:268 mtk_eint_ack() error: uninitialized symbol 'index'.
drivers/pinctrl/mediatek/mtk-eint.c:286 mtk_eint_soft_set() error: uninitialized symbol 'index'.
drivers/pinctrl/mediatek/mtk-eint.c:304 mtk_eint_soft_clr() error: uninitialized symbol 'index'.
drivers/pinctrl/mediatek/mtk-eint.c:344 mtk_eint_set_type() error: uninitialized symbol 'index'.

vim +/index +116 drivers/pinctrl/mediatek/mtk-eint.c

ecd65c2fde9b3e Chhao Chang     2024-10-25  115  
ecd65c2fde9b3e Chhao Chang     2024-10-25 @116  DEFINE_EINT_GET_FUNCTION(stat, eint->comp->regs->stat);
ecd65c2fde9b3e Chhao Chang     2024-10-25 @117  DEFINE_EINT_GET_FUNCTION(mask, eint->comp->regs->mask);
ecd65c2fde9b3e Chhao Chang     2024-10-25 @118  DEFINE_EINT_GET_FUNCTION(sens, eint->comp->regs->sens);
ecd65c2fde9b3e Chhao Chang     2024-10-25 @119  DEFINE_EINT_GET_FUNCTION(pol, eint->comp->regs->pol);
ecd65c2fde9b3e Chhao Chang     2024-10-25 @120  DEFINE_EINT_GET_FUNCTION(dom_en, eint->comp->regs->dom_en);
ecd65c2fde9b3e Chhao Chang     2024-10-25 @121  DEFINE_EINT_GET_FUNCTION(event, eint->comp->regs->event);
ecd65c2fde9b3e Chhao Chang     2024-10-25 @122  DEFINE_EINT_GET_FUNCTION(raw_stat, eint->comp->regs->raw_stat);
ecd65c2fde9b3e Chhao Chang     2024-10-25  123  
ecd65c2fde9b3e Chhao Chang     2024-10-25  124  int dump_eint_pin_status(unsigned int eint_num)
ecd65c2fde9b3e Chhao Chang     2024-10-25  125  {
ecd65c2fde9b3e Chhao Chang     2024-10-25  126         unsigned int stat, raw_stat, mask, sens, pol, dom_en, event;
ecd65c2fde9b3e Chhao Chang     2024-10-25  127  
ecd65c2fde9b3e Chhao Chang     2024-10-25  128         if (eint_num < 0 || eint_num > global_eintc->total_pin_number)
ecd65c2fde9b3e Chhao Chang     2024-10-25  129                 return ENODEV;
ecd65c2fde9b3e Chhao Chang     2024-10-25  130  
ecd65c2fde9b3e Chhao Chang     2024-10-25  131         stat = mtk_eint_get_stat(global_eintc, eint_num);
ecd65c2fde9b3e Chhao Chang     2024-10-25  132         raw_stat = mtk_eint_get_raw_stat(global_eintc, eint_num);
ecd65c2fde9b3e Chhao Chang     2024-10-25  133         mask = mtk_eint_get_mask(global_eintc, eint_num);
ecd65c2fde9b3e Chhao Chang     2024-10-25  134         sens = mtk_eint_get_sens(global_eintc, eint_num);
ecd65c2fde9b3e Chhao Chang     2024-10-25  135         pol = mtk_eint_get_pol(global_eintc, eint_num);
ecd65c2fde9b3e Chhao Chang     2024-10-25  136         dom_en = mtk_eint_get_dom_en(global_eintc, eint_num);
ecd65c2fde9b3e Chhao Chang     2024-10-25  137         event = mtk_eint_get_event(global_eintc, eint_num);
ecd65c2fde9b3e Chhao Chang     2024-10-25  138         dev_info(global_eintc->dev, "%s eint_num:%u=stat:%u,raw:%u, \
ecd65c2fde9b3e Chhao Chang     2024-10-25  139  		       mask:%u, sens:%u,pol:%u,dom_en:%u,event:%u\n",
ecd65c2fde9b3e Chhao Chang     2024-10-25  140  		       __func__, eint_num, stat, raw_stat, mask, sens,
ecd65c2fde9b3e Chhao Chang     2024-10-25  141  		       pol, dom_en, event);
ecd65c2fde9b3e Chhao Chang     2024-10-25  142         return 0;
ecd65c2fde9b3e Chhao Chang     2024-10-25  143  }
ecd65c2fde9b3e Chhao Chang     2024-10-25  144  EXPORT_SYMBOL_GPL(dump_eint_pin_status);
ecd65c2fde9b3e Chhao Chang     2024-10-25  145  
e46df235b4e605 Sean Wang       2018-05-21  146  static unsigned int mtk_eint_can_en_debounce(struct mtk_eint *eint,
e46df235b4e605 Sean Wang       2018-05-21  147  					     unsigned int eint_num)
e46df235b4e605 Sean Wang       2018-05-21  148  {
e46df235b4e605 Sean Wang       2018-05-21  149  	unsigned int sens;
ecd65c2fde9b3e Chhao Chang     2024-10-25  150  	unsigned int instance, index;
ecd65c2fde9b3e Chhao Chang     2024-10-25  151  	void __iomem *reg = mtk_eint_get_ofset(eint, eint_num,
ecd65c2fde9b3e Chhao Chang     2024-10-25  152  						eint->comp->regs->sens,
ecd65c2fde9b3e Chhao Chang     2024-10-25  153  						&instance, &index);
ecd65c2fde9b3e Chhao Chang     2024-10-25 @154  	unsigned int bit = BIT(index & 0x1f);
ecd65c2fde9b3e Chhao Chang     2024-10-25  155  
ecd65c2fde9b3e Chhao Chang     2024-10-25  156  	if (!reg) {
ecd65c2fde9b3e Chhao Chang     2024-10-25  157  		dev_err(eint->dev, "%s invalid eint_num %d\n",
ecd65c2fde9b3e Chhao Chang     2024-10-25  158  			__func__, eint_num);
ecd65c2fde9b3e Chhao Chang     2024-10-25  159  		return 0;
ecd65c2fde9b3e Chhao Chang     2024-10-25  160  	}
e46df235b4e605 Sean Wang       2018-05-21  161  
e46df235b4e605 Sean Wang       2018-05-21  162  	if (readl(reg) & bit)
e46df235b4e605 Sean Wang       2018-05-21  163  		sens = MTK_EINT_LEVEL_SENSITIVE;
e46df235b4e605 Sean Wang       2018-05-21  164  	else
e46df235b4e605 Sean Wang       2018-05-21  165  		sens = MTK_EINT_EDGE_SENSITIVE;
e46df235b4e605 Sean Wang       2018-05-21  166  
ecd65c2fde9b3e Chhao Chang     2024-10-25  167  	if (eint->pins[eint_num].debounce &&
ecd65c2fde9b3e Chhao Chang     2024-10-25  168  	    sens != MTK_EINT_EDGE_SENSITIVE)
e46df235b4e605 Sean Wang       2018-05-21  169  		return 1;
e46df235b4e605 Sean Wang       2018-05-21  170  	else
e46df235b4e605 Sean Wang       2018-05-21  171  		return 0;
e46df235b4e605 Sean Wang       2018-05-21  172  }
e46df235b4e605 Sean Wang       2018-05-21  173  
ecd65c2fde9b3e Chhao Chang     2024-10-25  174  static int mtk_eint_flip_edge(struct mtk_eint *eint, int eint_num)
e46df235b4e605 Sean Wang       2018-05-21  175  {
e46df235b4e605 Sean Wang       2018-05-21  176  	int start_level, curr_level;
ecd65c2fde9b3e Chhao Chang     2024-10-25  177  	unsigned int reg_ofset;
ecd65c2fde9b3e Chhao Chang     2024-10-25  178  	unsigned int instance, index, mask, port;
ecd65c2fde9b3e Chhao Chang     2024-10-25  179  	void __iomem *reg;
ecd65c2fde9b3e Chhao Chang     2024-10-25  180  
ecd65c2fde9b3e Chhao Chang     2024-10-25  181  	reg = mtk_eint_get_ofset(eint, eint_num, MTK_EINT_NO_OFSET,
ecd65c2fde9b3e Chhao Chang     2024-10-25  182  				  &instance, &index);
ecd65c2fde9b3e Chhao Chang     2024-10-25  183  
ecd65c2fde9b3e Chhao Chang     2024-10-25  184  	if (!reg) {
ecd65c2fde9b3e Chhao Chang     2024-10-25  185  		dev_err(eint->dev, "%s invalid eint_num %d\n",
ecd65c2fde9b3e Chhao Chang     2024-10-25  186  			__func__, eint_num);
ecd65c2fde9b3e Chhao Chang     2024-10-25  187  		return 0;
ecd65c2fde9b3e Chhao Chang     2024-10-25  188  	}
ecd65c2fde9b3e Chhao Chang     2024-10-25  189  
ecd65c2fde9b3e Chhao Chang     2024-10-25  190  	mask = BIT(index & 0x1f);
ecd65c2fde9b3e Chhao Chang     2024-10-25  191  	port = index >> REG_GROUP;
ecd65c2fde9b3e Chhao Chang     2024-10-25  192  	reg = eint->instances[instance].base + port * REG_OFSET;
e46df235b4e605 Sean Wang       2018-05-21  193  
ecd65c2fde9b3e Chhao Chang     2024-10-25  194  	curr_level = eint->gpio_xlate->get_gpio_state(eint->pctl, eint_num);
e46df235b4e605 Sean Wang       2018-05-21  195  
e46df235b4e605 Sean Wang       2018-05-21  196  	do {
e46df235b4e605 Sean Wang       2018-05-21  197  		start_level = curr_level;
e46df235b4e605 Sean Wang       2018-05-21  198  		if (start_level)
ecd65c2fde9b3e Chhao Chang     2024-10-25  199  			reg_ofset = eint->comp->regs->pol_clr;
e46df235b4e605 Sean Wang       2018-05-21  200  		else
ecd65c2fde9b3e Chhao Chang     2024-10-25  201  			reg_ofset = eint->comp->regs->pol_set;
ecd65c2fde9b3e Chhao Chang     2024-10-25  202  
ecd65c2fde9b3e Chhao Chang     2024-10-25  203  		writel(mask, reg + reg_ofset);
e46df235b4e605 Sean Wang       2018-05-21  204  
e46df235b4e605 Sean Wang       2018-05-21  205  		curr_level = eint->gpio_xlate->get_gpio_state(eint->pctl,
ecd65c2fde9b3e Chhao Chang     2024-10-25  206  							      eint_num);
e46df235b4e605 Sean Wang       2018-05-21  207  	} while (start_level != curr_level);
e46df235b4e605 Sean Wang       2018-05-21  208  
e46df235b4e605 Sean Wang       2018-05-21  209  	return start_level;
e46df235b4e605 Sean Wang       2018-05-21  210  }
e46df235b4e605 Sean Wang       2018-05-21  211  
e46df235b4e605 Sean Wang       2018-05-21  212  static void mtk_eint_mask(struct irq_data *d)
e46df235b4e605 Sean Wang       2018-05-21  213  {
e46df235b4e605 Sean Wang       2018-05-21  214  	struct mtk_eint *eint = irq_data_get_irq_chip_data(d);
ecd65c2fde9b3e Chhao Chang     2024-10-25  215  	unsigned int instance, index;
ecd65c2fde9b3e Chhao Chang     2024-10-25  216  	void __iomem *reg = mtk_eint_get_ofset(eint, d->hwirq,
ecd65c2fde9b3e Chhao Chang     2024-10-25  217  						eint->comp->regs->mask_set,
ecd65c2fde9b3e Chhao Chang     2024-10-25  218  						&instance, &index);
ecd65c2fde9b3e Chhao Chang     2024-10-25 @219  	u32 mask = BIT(index & 0x1f);
ecd65c2fde9b3e Chhao Chang     2024-10-25  220  
ecd65c2fde9b3e Chhao Chang     2024-10-25  221  	if (!reg) {
ecd65c2fde9b3e Chhao Chang     2024-10-25  222  		dev_err(eint->dev, "%s invalid eint_num %lu\n",
ecd65c2fde9b3e Chhao Chang     2024-10-25  223  			__func__, d->hwirq);
ecd65c2fde9b3e Chhao Chang     2024-10-25  224  		return;
ecd65c2fde9b3e Chhao Chang     2024-10-25  225  	}
e46df235b4e605 Sean Wang       2018-05-21  226  
ecd65c2fde9b3e Chhao Chang     2024-10-25  227  	eint->instances[instance].cur_mask[index >> REG_GROUP] &= ~mask;
9d957a959bc8c3 Nicolas Boichat 2019-06-26  228  
e46df235b4e605 Sean Wang       2018-05-21  229  	writel(mask, reg);
e46df235b4e605 Sean Wang       2018-05-21  230  }
e46df235b4e605 Sean Wang       2018-05-21  231  
e46df235b4e605 Sean Wang       2018-05-21  232  static void mtk_eint_unmask(struct irq_data *d)
e46df235b4e605 Sean Wang       2018-05-21  233  {
e46df235b4e605 Sean Wang       2018-05-21  234  	struct mtk_eint *eint = irq_data_get_irq_chip_data(d);
ecd65c2fde9b3e Chhao Chang     2024-10-25  235  	unsigned int instance, index;
ecd65c2fde9b3e Chhao Chang     2024-10-25  236  	void __iomem *reg = mtk_eint_get_ofset(eint, d->hwirq,
ecd65c2fde9b3e Chhao Chang     2024-10-25  237  						eint->comp->regs->mask_clr,
ecd65c2fde9b3e Chhao Chang     2024-10-25  238  						&instance, &index);
ecd65c2fde9b3e Chhao Chang     2024-10-25 @239  	u32 mask = BIT(index & 0x1f);
ecd65c2fde9b3e Chhao Chang     2024-10-25  240  
ecd65c2fde9b3e Chhao Chang     2024-10-25  241  	if (!reg) {
ecd65c2fde9b3e Chhao Chang     2024-10-25  242  		dev_err(eint->dev, "%s invalid eint_num %lu\n",
ecd65c2fde9b3e Chhao Chang     2024-10-25  243  			__func__, d->hwirq);
ecd65c2fde9b3e Chhao Chang     2024-10-25  244  		return;
ecd65c2fde9b3e Chhao Chang     2024-10-25  245  	}
e46df235b4e605 Sean Wang       2018-05-21  246  
ecd65c2fde9b3e Chhao Chang     2024-10-25  247  	eint->instances[instance].cur_mask[index >> REG_GROUP] |= mask;
9d957a959bc8c3 Nicolas Boichat 2019-06-26  248  
e46df235b4e605 Sean Wang       2018-05-21  249  	writel(mask, reg);
e46df235b4e605 Sean Wang       2018-05-21  250  
ecd65c2fde9b3e Chhao Chang     2024-10-25  251  	if (eint->pins[d->hwirq].dual_edge)
e46df235b4e605 Sean Wang       2018-05-21  252  		mtk_eint_flip_edge(eint, d->hwirq);
e46df235b4e605 Sean Wang       2018-05-21  253  }
e46df235b4e605 Sean Wang       2018-05-21  254  
ecd65c2fde9b3e Chhao Chang     2024-10-25  255  static void mtk_eint_ack(struct irq_data *d)
ecd65c2fde9b3e Chhao Chang     2024-10-25  256  {
ecd65c2fde9b3e Chhao Chang     2024-10-25  257  	struct mtk_eint *eint = irq_data_get_irq_chip_data(d);
ecd65c2fde9b3e Chhao Chang     2024-10-25  258  	unsigned int instance, index;
ecd65c2fde9b3e Chhao Chang     2024-10-25  259  	void __iomem *reg;
ecd65c2fde9b3e Chhao Chang     2024-10-25  260  	unsigned int bit;
ecd65c2fde9b3e Chhao Chang     2024-10-25  261  
ecd65c2fde9b3e Chhao Chang     2024-10-25  262  	if (eint->comp->ops.ack)
ecd65c2fde9b3e Chhao Chang     2024-10-25  263  		eint->comp->ops.ack(d);
ecd65c2fde9b3e Chhao Chang     2024-10-25  264  	else {
ecd65c2fde9b3e Chhao Chang     2024-10-25  265  		reg = mtk_eint_get_ofset(eint, d->hwirq,
ecd65c2fde9b3e Chhao Chang     2024-10-25  266  					  eint->comp->regs->ack,
ecd65c2fde9b3e Chhao Chang     2024-10-25  267  					  &instance, &index);
ecd65c2fde9b3e Chhao Chang     2024-10-25 @268  		bit = BIT(index & 0x1f);
ecd65c2fde9b3e Chhao Chang     2024-10-25  269  		if (!reg) {
ecd65c2fde9b3e Chhao Chang     2024-10-25  270  			dev_err(eint->dev, "%s invalid eint_num %lu\n",
ecd65c2fde9b3e Chhao Chang     2024-10-25  271  				__func__, d->hwirq);
ecd65c2fde9b3e Chhao Chang     2024-10-25  272  			return;
ecd65c2fde9b3e Chhao Chang     2024-10-25  273  		}
ecd65c2fde9b3e Chhao Chang     2024-10-25  274  
ecd65c2fde9b3e Chhao Chang     2024-10-25  275  		writel(bit, reg);
ecd65c2fde9b3e Chhao Chang     2024-10-25  276  	}
ecd65c2fde9b3e Chhao Chang     2024-10-25  277  }
ecd65c2fde9b3e Chhao Chang     2024-10-25  278  
ecd65c2fde9b3e Chhao Chang     2024-10-25  279  static void mtk_eint_soft_set(struct mtk_eint *eint,
e46df235b4e605 Sean Wang       2018-05-21  280  				      unsigned int eint_num)
e46df235b4e605 Sean Wang       2018-05-21  281  {
ecd65c2fde9b3e Chhao Chang     2024-10-25  282  	unsigned int instance, index;
ecd65c2fde9b3e Chhao Chang     2024-10-25  283  	void __iomem *reg = mtk_eint_get_ofset(eint, eint_num,
ecd65c2fde9b3e Chhao Chang     2024-10-25  284  						eint->comp->regs->soft_set,
ecd65c2fde9b3e Chhao Chang     2024-10-25  285  						&instance, &index);
ecd65c2fde9b3e Chhao Chang     2024-10-25 @286  	unsigned int bit = BIT(index & 0x1f);
e46df235b4e605 Sean Wang       2018-05-21  287  
ecd65c2fde9b3e Chhao Chang     2024-10-25  288  	if (!reg) {
ecd65c2fde9b3e Chhao Chang     2024-10-25  289  		dev_err(eint->dev, "%s invalid eint_num %d\n",
ecd65c2fde9b3e Chhao Chang     2024-10-25  290  			__func__, eint_num);
ecd65c2fde9b3e Chhao Chang     2024-10-25  291  		return;
e46df235b4e605 Sean Wang       2018-05-21  292  	}
e46df235b4e605 Sean Wang       2018-05-21  293  
ecd65c2fde9b3e Chhao Chang     2024-10-25  294  	writel(bit, reg);
ecd65c2fde9b3e Chhao Chang     2024-10-25  295  }
ecd65c2fde9b3e Chhao Chang     2024-10-25  296  
ecd65c2fde9b3e Chhao Chang     2024-10-25  297  static void mtk_eint_soft_clr(struct mtk_eint *eint,
ecd65c2fde9b3e Chhao Chang     2024-10-25  298  				      unsigned int eint_num)
e46df235b4e605 Sean Wang       2018-05-21  299  {
ecd65c2fde9b3e Chhao Chang     2024-10-25  300  	unsigned int instance, index;
ecd65c2fde9b3e Chhao Chang     2024-10-25  301  	void __iomem *reg = mtk_eint_get_ofset(eint, eint_num,
ecd65c2fde9b3e Chhao Chang     2024-10-25  302  						eint->comp->regs->soft_clr,
ecd65c2fde9b3e Chhao Chang     2024-10-25  303  						&instance, &index);
ecd65c2fde9b3e Chhao Chang     2024-10-25 @304  	unsigned int bit = BIT(index & 0x1f);
e46df235b4e605 Sean Wang       2018-05-21  305  
ecd65c2fde9b3e Chhao Chang     2024-10-25  306  	if (!reg) {
ecd65c2fde9b3e Chhao Chang     2024-10-25  307  		dev_err(eint->dev, "%s invalid eint_num %d\n",
ecd65c2fde9b3e Chhao Chang     2024-10-25  308  			__func__, eint_num);
ecd65c2fde9b3e Chhao Chang     2024-10-25  309  		return;
ecd65c2fde9b3e Chhao Chang     2024-10-25  310  	}
ecd65c2fde9b3e Chhao Chang     2024-10-25  311  
ecd65c2fde9b3e Chhao Chang     2024-10-25  312  	writel(bit, reg);
e46df235b4e605 Sean Wang       2018-05-21  313  }
e46df235b4e605 Sean Wang       2018-05-21  314  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
