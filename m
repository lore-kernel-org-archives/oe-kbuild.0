Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A452273FE
	for <oe-kbuild@lists.linux.dev>; Sat, 26 Jul 2025 18:44:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753555456; cv=none; b=Ch5YK9AAKJ+h2bOGQtmAdGpjPJIVhATmrvQpNc59X4fAAGqoGIV+w9d5tCf5/Yk0n4Dt0oyswA3nPp3ZXu+XxKjuDRiuq8Oc/31bri9XfvrSHC3oWqj1CruWowMWy8fBe/IKeMrHf+dMvduCrWv2BXXniDlaFQo5rCOGZTiK0QU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753555456; c=relaxed/simple;
	bh=+di+hihVAY6LbsimS4HCwUaktHuKF4rJhZat/ja2ob4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MXsJZMHGJaJb03znZjLDea+I2onbDBvib8Krn7KrR0uIF1AEL+cCnTo6BaUEA/rIRg9MJk2n2GC5FTtTh2nJENJ5xQCbKcpqe8NDyUGeE4W+z+PCLaLeCPT6TY7OeDNxewcAWoedAH7rN9rMJtpj54eYo7Wd5VGRRD61AjSVw/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XLimoWcJ; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XLimoWcJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753555454; x=1785091454;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+di+hihVAY6LbsimS4HCwUaktHuKF4rJhZat/ja2ob4=;
  b=XLimoWcJGuzOz1Nij0REnM1K7xwMmSUeliziOc9O8pLoDwwXSbrcZGm/
   4zi3dix64jm3HlrBTkkTFZJhB2f4HcQL+FKiS/4CFXW0A7VrAUwdfT5PW
   m5l9TCLwEFIKRqeslx4Dfi/YBtnkmHtukPhinMcGa+KSgf1/x84U+pHjH
   CSjVoM/VkaIS812uzPTXeQ+NYJBzchm0DBDh3GtVovSyXNKFu0plTk0PC
   W5RCgukTqrRs67ci52qovgCWmNsirpi/bBagGNudX2eLwn+ggokKr6HTX
   iYdfbIRvP5YKlmRf+ZkBTUiskQgHzB7hNjs6ndOmQNtq6nVHd1mt0PDyq
   Q==;
X-CSE-ConnectionGUID: PChEtl4JTdaQLEluTWe9Rg==
X-CSE-MsgGUID: Ajrt1fOPSGCI03Ke+epz1Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11504"; a="67212449"
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; 
   d="scan'208";a="67212449"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jul 2025 11:44:13 -0700
X-CSE-ConnectionGUID: T6JAAAkdQ3+Nm86S2kL3Fw==
X-CSE-MsgGUID: Ya2Z8bWDTNeHFHB8iDqxLA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; 
   d="scan'208";a="165941911"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 26 Jul 2025 11:44:13 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ufjsP-000MCB-2p;
	Sat, 26 Jul 2025 18:44:09 +0000
Date: Sun, 27 Jul 2025 02:43:21 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v3 04/11] net: qrtr: support identical node ids
Message-ID: <202507270223.HrqP7hYH-lkp@intel.com>
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
In-Reply-To: <8fc53fad3065a9860e3f44cf8853494dd6eb6b47.1753312999.git.ionic@ionic.de>
References: <8fc53fad3065a9860e3f44cf8853494dd6eb6b47.1753312999.git.ionic@ionic.de>
TO: Mihai Moldovan <ionic@ionic.de>
TO: linux-arm-msm@vger.kernel.org
TO: Manivannan Sadhasivam <mani@kernel.org>
CC: Denis Kenzior <denkenz@gmail.com>
CC: Eric Dumazet <edumazet@google.com>
CC: Kuniyuki Iwashima <kuniyu@google.com>
CC: Paolo Abeni <pabeni@redhat.com>
CC: Willem de Bruijn <willemb@google.com>
CC: "David S . Miller" <davem@davemloft.net>
CC: Jakub Kicinski <kuba@kernel.org>
CC: Simon Horman <horms@kernel.org>
CC: linux-kernel@vger.kernel.org
CC: netdev@vger.kernel.org

Hi Mihai,

kernel test robot noticed the following build warnings:

[auto build test WARNING on mani-mhi/mhi-next]
[also build test WARNING on net-next/main net/main linus/master v6.16-rc7 next-20250725]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Mihai-Moldovan/net-qrtr-ns-validate-msglen-before-ctrl_pkt-use/20250724-073030
base:   https://git.kernel.org/pub/scm/linux/kernel/git/mani/mhi.git mhi-next
patch link:    https://lore.kernel.org/r/8fc53fad3065a9860e3f44cf8853494dd6eb6b47.1753312999.git.ionic%40ionic.de
patch subject: [PATCH v3 04/11] net: qrtr: support identical node ids
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: x86_64-randconfig-161-20250726 (https://download.01.org/0day-ci/archive/20250727/202507270223.HrqP7hYH-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202507270223.HrqP7hYH-lkp@intel.com/

New smatch warnings:
net/qrtr/af_qrtr.c:613 qrtr_endpoint_post() warn: missing error code 'ret'

Old smatch warnings:
net/qrtr/af_qrtr.c:302 qrtr_tx_wait() warn: impossible condition '(dest_node < ((-1) - ((((~(0)) >> ((8 * 8) >> 1))) >> 1))) => (s32min-s32max < s32min)'
net/qrtr/af_qrtr.c:304 qrtr_tx_wait() warn: impossible condition '(dest_port < ((-1) - ((((~(0)) >> ((8 * 8) >> 1))) >> 1))) => (s32min-s32max < s32min)'
net/qrtr/af_qrtr.c:375 qrtr_tx_flow_failed() warn: impossible condition '(dest_node < ((-1) - ((((~(0)) >> ((8 * 8) >> 1))) >> 1))) => (s32min-s32max < s32min)'
net/qrtr/af_qrtr.c:377 qrtr_tx_flow_failed() warn: impossible condition '(dest_port < ((-1) - ((((~(0)) >> ((8 * 8) >> 1))) >> 1))) => (s32min-s32max < s32min)'

vim +/ret +613 net/qrtr/af_qrtr.c

bdabad3e363d82 net/qrtr/qrtr.c    Courtney Cavin      2016-05-06  500  
bdabad3e363d82 net/qrtr/qrtr.c    Courtney Cavin      2016-05-06  501  /**
bdabad3e363d82 net/qrtr/qrtr.c    Courtney Cavin      2016-05-06  502   * qrtr_endpoint_post() - post incoming data
bdabad3e363d82 net/qrtr/qrtr.c    Courtney Cavin      2016-05-06  503   * @ep: endpoint handle
bdabad3e363d82 net/qrtr/qrtr.c    Courtney Cavin      2016-05-06  504   * @data: data pointer
bdabad3e363d82 net/qrtr/qrtr.c    Courtney Cavin      2016-05-06  505   * @len: size of data in bytes
bdabad3e363d82 net/qrtr/qrtr.c    Courtney Cavin      2016-05-06  506   *
bdabad3e363d82 net/qrtr/qrtr.c    Courtney Cavin      2016-05-06  507   * Return: 0 on success; negative error code on failure
bdabad3e363d82 net/qrtr/qrtr.c    Courtney Cavin      2016-05-06  508   */
bdabad3e363d82 net/qrtr/qrtr.c    Courtney Cavin      2016-05-06  509  int qrtr_endpoint_post(struct qrtr_endpoint *ep, const void *data, size_t len)
bdabad3e363d82 net/qrtr/qrtr.c    Courtney Cavin      2016-05-06  510  {
bdabad3e363d82 net/qrtr/qrtr.c    Courtney Cavin      2016-05-06  511  	struct qrtr_node *node = ep->node;
194ccc88297ae7 net/qrtr/qrtr.c    Bjorn Andersson     2017-10-10  512  	const struct qrtr_hdr_v1 *v1;
194ccc88297ae7 net/qrtr/qrtr.c    Bjorn Andersson     2017-10-10  513  	const struct qrtr_hdr_v2 *v2;
e04df98adf7d7d net/qrtr/qrtr.c    Bjorn Andersson     2020-01-13  514  	struct qrtr_sock *ipc;
bdabad3e363d82 net/qrtr/qrtr.c    Courtney Cavin      2016-05-06  515  	struct sk_buff *skb;
f507a9b6e63b9f net/qrtr/qrtr.c    Bjorn Andersson     2017-10-10  516  	struct qrtr_cb *cb;
ad9d24c9429e21 net/qrtr/qrtr.c    Pavel Skripkin      2021-06-14  517  	size_t size;
bdabad3e363d82 net/qrtr/qrtr.c    Courtney Cavin      2016-05-06  518  	unsigned int ver;
194ccc88297ae7 net/qrtr/qrtr.c    Bjorn Andersson     2017-10-10  519  	size_t hdrlen;
e92239648a9190 net/qrtr/af_qrtr.c Mihai Moldovan      2025-07-24  520  	int ret = -EINVAL;
bdabad3e363d82 net/qrtr/qrtr.c    Courtney Cavin      2016-05-06  521  
8ff41cc2171470 net/qrtr/qrtr.c    Dan Carpenter       2020-06-30  522  	if (len == 0 || len & 3)
bdabad3e363d82 net/qrtr/qrtr.c    Courtney Cavin      2016-05-06  523  		return -EINVAL;
bdabad3e363d82 net/qrtr/qrtr.c    Courtney Cavin      2016-05-06  524  
093b036aa94e01 net/qrtr/qrtr.c    Pavel Skripkin      2021-03-01  525  	skb = __netdev_alloc_skb(NULL, len, GFP_ATOMIC | __GFP_NOWARN);
194ccc88297ae7 net/qrtr/qrtr.c    Bjorn Andersson     2017-10-10  526  	if (!skb)
194ccc88297ae7 net/qrtr/qrtr.c    Bjorn Andersson     2017-10-10  527  		return -ENOMEM;
194ccc88297ae7 net/qrtr/qrtr.c    Bjorn Andersson     2017-10-10  528  
194ccc88297ae7 net/qrtr/qrtr.c    Bjorn Andersson     2017-10-10  529  	cb = (struct qrtr_cb *)skb->cb;
bdabad3e363d82 net/qrtr/qrtr.c    Courtney Cavin      2016-05-06  530  
194ccc88297ae7 net/qrtr/qrtr.c    Bjorn Andersson     2017-10-10  531  	/* Version field in v1 is little endian, so this works for both cases */
194ccc88297ae7 net/qrtr/qrtr.c    Bjorn Andersson     2017-10-10  532  	ver = *(u8*)data;
bdabad3e363d82 net/qrtr/qrtr.c    Courtney Cavin      2016-05-06  533  
194ccc88297ae7 net/qrtr/qrtr.c    Bjorn Andersson     2017-10-10  534  	switch (ver) {
194ccc88297ae7 net/qrtr/qrtr.c    Bjorn Andersson     2017-10-10  535  	case QRTR_PROTO_VER_1:
8ff41cc2171470 net/qrtr/qrtr.c    Dan Carpenter       2020-06-30  536  		if (len < sizeof(*v1))
8ff41cc2171470 net/qrtr/qrtr.c    Dan Carpenter       2020-06-30  537  			goto err;
194ccc88297ae7 net/qrtr/qrtr.c    Bjorn Andersson     2017-10-10  538  		v1 = data;
194ccc88297ae7 net/qrtr/qrtr.c    Bjorn Andersson     2017-10-10  539  		hdrlen = sizeof(*v1);
bdabad3e363d82 net/qrtr/qrtr.c    Courtney Cavin      2016-05-06  540  
194ccc88297ae7 net/qrtr/qrtr.c    Bjorn Andersson     2017-10-10  541  		cb->type = le32_to_cpu(v1->type);
194ccc88297ae7 net/qrtr/qrtr.c    Bjorn Andersson     2017-10-10  542  		cb->src_node = le32_to_cpu(v1->src_node_id);
194ccc88297ae7 net/qrtr/qrtr.c    Bjorn Andersson     2017-10-10  543  		cb->src_port = le32_to_cpu(v1->src_port_id);
194ccc88297ae7 net/qrtr/qrtr.c    Bjorn Andersson     2017-10-10  544  		cb->confirm_rx = !!v1->confirm_rx;
194ccc88297ae7 net/qrtr/qrtr.c    Bjorn Andersson     2017-10-10  545  		cb->dst_node = le32_to_cpu(v1->dst_node_id);
194ccc88297ae7 net/qrtr/qrtr.c    Bjorn Andersson     2017-10-10  546  		cb->dst_port = le32_to_cpu(v1->dst_port_id);
bdabad3e363d82 net/qrtr/qrtr.c    Courtney Cavin      2016-05-06  547  
194ccc88297ae7 net/qrtr/qrtr.c    Bjorn Andersson     2017-10-10  548  		size = le32_to_cpu(v1->size);
194ccc88297ae7 net/qrtr/qrtr.c    Bjorn Andersson     2017-10-10  549  		break;
194ccc88297ae7 net/qrtr/qrtr.c    Bjorn Andersson     2017-10-10  550  	case QRTR_PROTO_VER_2:
8ff41cc2171470 net/qrtr/qrtr.c    Dan Carpenter       2020-06-30  551  		if (len < sizeof(*v2))
8ff41cc2171470 net/qrtr/qrtr.c    Dan Carpenter       2020-06-30  552  			goto err;
194ccc88297ae7 net/qrtr/qrtr.c    Bjorn Andersson     2017-10-10  553  		v2 = data;
194ccc88297ae7 net/qrtr/qrtr.c    Bjorn Andersson     2017-10-10  554  		hdrlen = sizeof(*v2) + v2->optlen;
194ccc88297ae7 net/qrtr/qrtr.c    Bjorn Andersson     2017-10-10  555  
194ccc88297ae7 net/qrtr/qrtr.c    Bjorn Andersson     2017-10-10  556  		cb->type = v2->type;
194ccc88297ae7 net/qrtr/qrtr.c    Bjorn Andersson     2017-10-10  557  		cb->confirm_rx = !!(v2->flags & QRTR_FLAGS_CONFIRM_RX);
194ccc88297ae7 net/qrtr/qrtr.c    Bjorn Andersson     2017-10-10  558  		cb->src_node = le16_to_cpu(v2->src_node_id);
194ccc88297ae7 net/qrtr/qrtr.c    Bjorn Andersson     2017-10-10  559  		cb->src_port = le16_to_cpu(v2->src_port_id);
194ccc88297ae7 net/qrtr/qrtr.c    Bjorn Andersson     2017-10-10  560  		cb->dst_node = le16_to_cpu(v2->dst_node_id);
194ccc88297ae7 net/qrtr/qrtr.c    Bjorn Andersson     2017-10-10  561  		cb->dst_port = le16_to_cpu(v2->dst_port_id);
194ccc88297ae7 net/qrtr/qrtr.c    Bjorn Andersson     2017-10-10  562  
194ccc88297ae7 net/qrtr/qrtr.c    Bjorn Andersson     2017-10-10  563  		if (cb->src_port == (u16)QRTR_PORT_CTRL)
194ccc88297ae7 net/qrtr/qrtr.c    Bjorn Andersson     2017-10-10  564  			cb->src_port = QRTR_PORT_CTRL;
194ccc88297ae7 net/qrtr/qrtr.c    Bjorn Andersson     2017-10-10  565  		if (cb->dst_port == (u16)QRTR_PORT_CTRL)
194ccc88297ae7 net/qrtr/qrtr.c    Bjorn Andersson     2017-10-10  566  			cb->dst_port = QRTR_PORT_CTRL;
194ccc88297ae7 net/qrtr/qrtr.c    Bjorn Andersson     2017-10-10  567  
194ccc88297ae7 net/qrtr/qrtr.c    Bjorn Andersson     2017-10-10  568  		size = le32_to_cpu(v2->size);
194ccc88297ae7 net/qrtr/qrtr.c    Bjorn Andersson     2017-10-10  569  		break;
194ccc88297ae7 net/qrtr/qrtr.c    Bjorn Andersson     2017-10-10  570  	default:
194ccc88297ae7 net/qrtr/qrtr.c    Bjorn Andersson     2017-10-10  571  		pr_err("qrtr: Invalid version %d\n", ver);
194ccc88297ae7 net/qrtr/qrtr.c    Bjorn Andersson     2017-10-10  572  		goto err;
194ccc88297ae7 net/qrtr/qrtr.c    Bjorn Andersson     2017-10-10  573  	}
bdabad3e363d82 net/qrtr/qrtr.c    Courtney Cavin      2016-05-06  574  
69940b888e3502 net/qrtr/af_qrtr.c Vignesh Viswanathan 2023-07-14  575  	if (cb->dst_port == QRTR_PORT_CTRL_LEGACY)
69940b888e3502 net/qrtr/af_qrtr.c Vignesh Viswanathan 2023-07-14  576  		cb->dst_port = QRTR_PORT_CTRL;
69940b888e3502 net/qrtr/af_qrtr.c Vignesh Viswanathan 2023-07-14  577  
d2cabd2dc8da78 net/qrtr/qrtr.c    Dan Carpenter       2021-09-02  578  	if (!size || len != ALIGN(size, 4) + hdrlen)
194ccc88297ae7 net/qrtr/qrtr.c    Bjorn Andersson     2017-10-10  579  		goto err;
bdabad3e363d82 net/qrtr/qrtr.c    Courtney Cavin      2016-05-06  580  
6417070918de3b net/qrtr/af_qrtr.c Ziyang Xuan         2023-04-10  581  	if ((cb->type == QRTR_TYPE_NEW_SERVER ||
6417070918de3b net/qrtr/af_qrtr.c Ziyang Xuan         2023-04-10  582  	     cb->type == QRTR_TYPE_RESUME_TX) &&
6417070918de3b net/qrtr/af_qrtr.c Ziyang Xuan         2023-04-10  583  	    size < sizeof(struct qrtr_ctrl_pkt))
6417070918de3b net/qrtr/af_qrtr.c Ziyang Xuan         2023-04-10  584  		goto err;
6417070918de3b net/qrtr/af_qrtr.c Ziyang Xuan         2023-04-10  585  
5fdeb0d372ab33 net/qrtr/qrtr.c    Bjorn Andersson     2020-01-13  586  	if (cb->dst_port != QRTR_PORT_CTRL && cb->type != QRTR_TYPE_DATA &&
5fdeb0d372ab33 net/qrtr/qrtr.c    Bjorn Andersson     2020-01-13  587  	    cb->type != QRTR_TYPE_RESUME_TX)
194ccc88297ae7 net/qrtr/qrtr.c    Bjorn Andersson     2017-10-10  588  		goto err;
f507a9b6e63b9f net/qrtr/qrtr.c    Bjorn Andersson     2017-10-10  589  
194ccc88297ae7 net/qrtr/qrtr.c    Bjorn Andersson     2017-10-10  590  	skb_put_data(skb, data + hdrlen, size);
bdabad3e363d82 net/qrtr/qrtr.c    Courtney Cavin      2016-05-06  591  
5222378bf30633 net/qrtr/af_qrtr.c Denis Kenzior       2025-07-24  592  	ret = qrtr_node_assign(node, cb->src_node);
5222378bf30633 net/qrtr/af_qrtr.c Denis Kenzior       2025-07-24  593  	if (ret)
5222378bf30633 net/qrtr/af_qrtr.c Denis Kenzior       2025-07-24  594  		goto err;
e04df98adf7d7d net/qrtr/qrtr.c    Bjorn Andersson     2020-01-13  595  
0baa99ee353c20 net/qrtr/qrtr.c    Loic Poulain        2020-11-06  596  	if (cb->type == QRTR_TYPE_NEW_SERVER) {
0baa99ee353c20 net/qrtr/qrtr.c    Loic Poulain        2020-11-06  597  		/* Remote node endpoint can bridge other distant nodes */
aaa8e4922c887f net/qrtr/qrtr.c    Dan Carpenter       2021-08-30  598  		const struct qrtr_ctrl_pkt *pkt;
0baa99ee353c20 net/qrtr/qrtr.c    Loic Poulain        2020-11-06  599  
aaa8e4922c887f net/qrtr/qrtr.c    Dan Carpenter       2021-08-30  600  		pkt = data + hdrlen;
5222378bf30633 net/qrtr/af_qrtr.c Denis Kenzior       2025-07-24  601  		ret = qrtr_node_assign(node, le32_to_cpu(pkt->server.node));
5222378bf30633 net/qrtr/af_qrtr.c Denis Kenzior       2025-07-24  602  		if (ret)
5222378bf30633 net/qrtr/af_qrtr.c Denis Kenzior       2025-07-24  603  			goto err;
0baa99ee353c20 net/qrtr/qrtr.c    Loic Poulain        2020-11-06  604  	}
0baa99ee353c20 net/qrtr/qrtr.c    Loic Poulain        2020-11-06  605  
e04df98adf7d7d net/qrtr/qrtr.c    Bjorn Andersson     2020-01-13  606  	if (cb->type == QRTR_TYPE_RESUME_TX) {
e92239648a9190 net/qrtr/af_qrtr.c Mihai Moldovan      2025-07-24  607  		ret = qrtr_tx_resume(node, skb);
e92239648a9190 net/qrtr/af_qrtr.c Mihai Moldovan      2025-07-24  608  		if (ret)
e92239648a9190 net/qrtr/af_qrtr.c Mihai Moldovan      2025-07-24  609  			goto err;
e04df98adf7d7d net/qrtr/qrtr.c    Bjorn Andersson     2020-01-13  610  	} else {
e04df98adf7d7d net/qrtr/qrtr.c    Bjorn Andersson     2020-01-13  611  		ipc = qrtr_port_lookup(cb->dst_port);
e04df98adf7d7d net/qrtr/qrtr.c    Bjorn Andersson     2020-01-13  612  		if (!ipc)
e04df98adf7d7d net/qrtr/qrtr.c    Bjorn Andersson     2020-01-13 @613  			goto err;
e04df98adf7d7d net/qrtr/qrtr.c    Bjorn Andersson     2020-01-13  614  
52f3456a96c067 net/qrtr/qrtr.c    Pavel Skripkin      2021-07-23  615  		if (sock_queue_rcv_skb(&ipc->sk, skb)) {
52f3456a96c067 net/qrtr/qrtr.c    Pavel Skripkin      2021-07-23  616  			qrtr_port_put(ipc);
e04df98adf7d7d net/qrtr/qrtr.c    Bjorn Andersson     2020-01-13  617  			goto err;
52f3456a96c067 net/qrtr/qrtr.c    Pavel Skripkin      2021-07-23  618  		}
e04df98adf7d7d net/qrtr/qrtr.c    Bjorn Andersson     2020-01-13  619  
e04df98adf7d7d net/qrtr/qrtr.c    Bjorn Andersson     2020-01-13  620  		qrtr_port_put(ipc);
e04df98adf7d7d net/qrtr/qrtr.c    Bjorn Andersson     2020-01-13  621  	}
bdabad3e363d82 net/qrtr/qrtr.c    Courtney Cavin      2016-05-06  622  
bdabad3e363d82 net/qrtr/qrtr.c    Courtney Cavin      2016-05-06  623  	return 0;
194ccc88297ae7 net/qrtr/qrtr.c    Bjorn Andersson     2017-10-10  624  
194ccc88297ae7 net/qrtr/qrtr.c    Bjorn Andersson     2017-10-10  625  err:
194ccc88297ae7 net/qrtr/qrtr.c    Bjorn Andersson     2017-10-10  626  	kfree_skb(skb);
e92239648a9190 net/qrtr/af_qrtr.c Mihai Moldovan      2025-07-24  627  	return ret;
194ccc88297ae7 net/qrtr/qrtr.c    Bjorn Andersson     2017-10-10  628  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
