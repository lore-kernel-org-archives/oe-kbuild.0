Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39E6E32ABCA
	for <oe-kbuild@lists.linux.dev>; Wed, 19 Nov 2025 23:10:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763593856; cv=none; b=F6DHpdTV9T/2zUO7+xXHcCNnuV0JdlvvGefglU+e5sy0QqIzd0OAQcMOHg+jnhlFzSOn3BQwIjAlG9acLHHZnh8UPD25ZkrIR30gp1JzZRlKbPhmgokTXEkwjLsZhQwYXMRJQLGNxY1GV+aJTj50yLczFrXsFKaOsr4ixfmCCHY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763593856; c=relaxed/simple;
	bh=xWUE/cUN/bw8h1+J5dykSB6GCns/xZd+7N1U7J4TVnw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jKAOKFJ51akfOCPnYo1s1PWCeuujeTZn1IpEuGHqnZaOIctNzM/IM9igoiHflrIlLtvbnYxPm04LkPjifBNLXAiEfvrXSIzvpLMbZWFhMt4WNQzJL4cOHS2eG5czGihI1du0G+JGj8mOxyEaADaVcfQeouIcEfKutvz7VjvjlPs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Zlu6A0gN; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Zlu6A0gN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763593854; x=1795129854;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xWUE/cUN/bw8h1+J5dykSB6GCns/xZd+7N1U7J4TVnw=;
  b=Zlu6A0gNshcJVgdDxzA7NsknubAx6z+JEsMeEFOaHVUtxdopHz4KruiZ
   xaJkmBSo3q6P7sOoNLAk9WssEeduAIN/tsEsoetZCDUUlkOZv/FvvU4+v
   wOQYZgHif0TvfWjqvigrfbxw4ej3ZeTkFax49WyiQx8Yov6/1yIRUDXLN
   avY/fQvp3v588/6lXEJxes57s8xK9E/GN21HaoxkMx6GulHYxLSm2c8aS
   DLxMcFC6CrP0oraOaz8e5b4uknNnSgPeI/QlX1TwoPlQ7waHEPoJITBV/
   KHTK9fxpsvWkRs5yG0+yTW6WE9ZYb1T2X9VOd7go36jJI6AfrPLgPizqV
   w==;
X-CSE-ConnectionGUID: HazzpZl2Qeq4Htptm77jSg==
X-CSE-MsgGUID: e1QIz4qYSo6y8ZkXM6LA9A==
X-IronPort-AV: E=McAfee;i="6800,10657,11618"; a="65354401"
X-IronPort-AV: E=Sophos;i="6.19,316,1754982000"; 
   d="scan'208";a="65354401"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2025 15:10:52 -0800
X-CSE-ConnectionGUID: QIX89ZjyRN6qyfZG99eR5A==
X-CSE-MsgGUID: KGFLYXi2Q4aenPJIxdU97g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,316,1754982000"; 
   d="scan'208";a="191990179"
Received: from lkp-server01.sh.intel.com (HELO adf6d29aa8d9) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 19 Nov 2025 15:10:50 -0800
Received: from kbuild by adf6d29aa8d9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vLrK4-0003P5-1Y;
	Wed, 19 Nov 2025 23:10:48 +0000
Date: Thu, 20 Nov 2025 07:10:09 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: Re: [PATCH v1 05/11] Bluetooth: btnxpuart: Add TLS host hello
 handshake implementation
Message-ID: <202511200650.6IddJ89j-lkp@intel.com>
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
In-Reply-To: <20251118142025.1982263-6-neeraj.sanjaykale@nxp.com>
References: <20251118142025.1982263-6-neeraj.sanjaykale@nxp.com>
TO: Neeraj Sanjay Kale <neeraj.sanjaykale@nxp.com>
TO: marcel@holtmann.org
TO: luiz.dentz@gmail.com
CC: linux-bluetooth@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: amitkumar.karwar@nxp.com
CC: sherry.sun@nxp.com
CC: dmitrii.lebed@nxp.com
CC: neeraj.sanjaykale@nxp.com

Hi Neeraj,

kernel test robot noticed the following build warnings:

[auto build test WARNING on bluetooth/master]
[also build test WARNING on bluetooth-next/master linus/master v6.18-rc6 next-20251119]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Neeraj-Sanjay-Kale/Bluetooth-btnxpuart-Add-firmware-metadata-parsing-for-secure-interface/20251118-223605
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bluetooth/bluetooth.git master
patch link:    https://lore.kernel.org/r/20251118142025.1982263-6-neeraj.sanjaykale%40nxp.com
patch subject: [PATCH v1 05/11] Bluetooth: btnxpuart: Add TLS host hello handshake implementation
:::::: branch date: 33 hours ago
:::::: commit date: 33 hours ago
config: x86_64-randconfig-103-20251119 (https://download.01.org/0day-ci/archive/20251120/202511200650.6IddJ89j-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202511200650.6IddJ89j-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/bluetooth/btnxpuart.c:1781:12-13: WARNING opportunity for kfree_sensitive/kvfree_sensitive (memset at line 1780)

vim +1781 drivers/bluetooth/btnxpuart.c

9e92c12afdb6eb Neeraj Sanjay Kale 2025-11-18  1708  
9e92c12afdb6eb Neeraj Sanjay Kale 2025-11-18  1709  static struct sk_buff *nxp_host_do_hello(struct hci_dev *hdev)
9e92c12afdb6eb Neeraj Sanjay Kale 2025-11-18  1710  {
9e92c12afdb6eb Neeraj Sanjay Kale 2025-11-18  1711  	struct btnxpuart_dev *nxpdev = hci_get_drvdata(hdev);
9e92c12afdb6eb Neeraj Sanjay Kale 2025-11-18  1712  	union nxp_tls_host_hello_payload tls_hello;
9e92c12afdb6eb Neeraj Sanjay Kale 2025-11-18  1713  	struct nxp_tls_host_hello *host_hello = &tls_hello.host_hello;
9e92c12afdb6eb Neeraj Sanjay Kale 2025-11-18  1714  	struct ecdh p = {0};
9e92c12afdb6eb Neeraj Sanjay Kale 2025-11-18  1715  	u8 *buf = NULL;
9e92c12afdb6eb Neeraj Sanjay Kale 2025-11-18  1716  	unsigned int buf_len;
9e92c12afdb6eb Neeraj Sanjay Kale 2025-11-18  1717  	struct sk_buff *skb;
9e92c12afdb6eb Neeraj Sanjay Kale 2025-11-18  1718  	int ret;
9e92c12afdb6eb Neeraj Sanjay Kale 2025-11-18  1719  
9e92c12afdb6eb Neeraj Sanjay Kale 2025-11-18  1720  	nxp_tls_hdr_init(&host_hello->hdr, sizeof(*host_hello), NXP_TLS_HOST_HELLO);
9e92c12afdb6eb Neeraj Sanjay Kale 2025-11-18  1721  
9e92c12afdb6eb Neeraj Sanjay Kale 2025-11-18  1722  	host_hello->sig_alg = cpu_to_le16(NXP_TLS_ECDSA_SECP256R1_SHA256);
9e92c12afdb6eb Neeraj Sanjay Kale 2025-11-18  1723  	host_hello->key_exchange_type = cpu_to_le16(NXP_TLS_ECDHE_SECP256R1);
9e92c12afdb6eb Neeraj Sanjay Kale 2025-11-18  1724  	host_hello->cipher_suite = cpu_to_le16(NXP_TLS_AES_128_GCM_SHA256);
9e92c12afdb6eb Neeraj Sanjay Kale 2025-11-18  1725  
9e92c12afdb6eb Neeraj Sanjay Kale 2025-11-18  1726  	get_random_bytes(host_hello->random, sizeof(host_hello->random));
9e92c12afdb6eb Neeraj Sanjay Kale 2025-11-18  1727  
9e92c12afdb6eb Neeraj Sanjay Kale 2025-11-18  1728  	/* Generate random private key */
9e92c12afdb6eb Neeraj Sanjay Kale 2025-11-18  1729  	p.key_size = 32;
9e92c12afdb6eb Neeraj Sanjay Kale 2025-11-18  1730  	p.key = kzalloc(p.key_size, GFP_KERNEL);
9e92c12afdb6eb Neeraj Sanjay Kale 2025-11-18  1731  	if (!p.key)
9e92c12afdb6eb Neeraj Sanjay Kale 2025-11-18  1732  		return ERR_PTR(-ENOMEM);
9e92c12afdb6eb Neeraj Sanjay Kale 2025-11-18  1733  
9e92c12afdb6eb Neeraj Sanjay Kale 2025-11-18  1734  	get_random_bytes(p.key, p.key_size);
9e92c12afdb6eb Neeraj Sanjay Kale 2025-11-18  1735  
9e92c12afdb6eb Neeraj Sanjay Kale 2025-11-18  1736  	buf_len = crypto_ecdh_key_len(&p);
9e92c12afdb6eb Neeraj Sanjay Kale 2025-11-18  1737  	buf = kzalloc(buf_len, GFP_KERNEL);
9e92c12afdb6eb Neeraj Sanjay Kale 2025-11-18  1738  	if (!buf) {
9e92c12afdb6eb Neeraj Sanjay Kale 2025-11-18  1739  		ret = -ENOMEM;
9e92c12afdb6eb Neeraj Sanjay Kale 2025-11-18  1740  		goto free_key;
9e92c12afdb6eb Neeraj Sanjay Kale 2025-11-18  1741  	}
9e92c12afdb6eb Neeraj Sanjay Kale 2025-11-18  1742  
9e92c12afdb6eb Neeraj Sanjay Kale 2025-11-18  1743  	ret = crypto_ecdh_encode_key(buf, buf_len, &p);
9e92c12afdb6eb Neeraj Sanjay Kale 2025-11-18  1744  	if (ret) {
9e92c12afdb6eb Neeraj Sanjay Kale 2025-11-18  1745  		bt_dev_err(hdev, "crypto_ecdh_encode_key() failed");
9e92c12afdb6eb Neeraj Sanjay Kale 2025-11-18  1746  		goto free_buf;
9e92c12afdb6eb Neeraj Sanjay Kale 2025-11-18  1747  	}
9e92c12afdb6eb Neeraj Sanjay Kale 2025-11-18  1748  
9e92c12afdb6eb Neeraj Sanjay Kale 2025-11-18  1749  	ret = crypto_kpp_set_secret(nxpdev->crypto.kpp, buf, buf_len);
9e92c12afdb6eb Neeraj Sanjay Kale 2025-11-18  1750  	if (ret) {
9e92c12afdb6eb Neeraj Sanjay Kale 2025-11-18  1751  		bt_dev_err(hdev, "crypto_kpp_set_secret() failed");
9e92c12afdb6eb Neeraj Sanjay Kale 2025-11-18  1752  		goto free_buf;
9e92c12afdb6eb Neeraj Sanjay Kale 2025-11-18  1753  	}
9e92c12afdb6eb Neeraj Sanjay Kale 2025-11-18  1754  
9e92c12afdb6eb Neeraj Sanjay Kale 2025-11-18  1755  	ret = nxp_generate_ecdh_public_key(nxpdev->crypto.kpp, host_hello->pubkey);
9e92c12afdb6eb Neeraj Sanjay Kale 2025-11-18  1756  	if (ret) {
9e92c12afdb6eb Neeraj Sanjay Kale 2025-11-18  1757  		bt_dev_err(hdev, "Failed to generate ECDH public key: %d", ret);
9e92c12afdb6eb Neeraj Sanjay Kale 2025-11-18  1758  		goto free_buf;
9e92c12afdb6eb Neeraj Sanjay Kale 2025-11-18  1759  	}
9e92c12afdb6eb Neeraj Sanjay Kale 2025-11-18  1760  
9e92c12afdb6eb Neeraj Sanjay Kale 2025-11-18  1761  	ret = crypto_shash_update(nxpdev->crypto.tls_handshake_hash_desc,
9e92c12afdb6eb Neeraj Sanjay Kale 2025-11-18  1762  				  (u8 *)host_hello, sizeof(*host_hello));
9e92c12afdb6eb Neeraj Sanjay Kale 2025-11-18  1763  	if (ret) {
9e92c12afdb6eb Neeraj Sanjay Kale 2025-11-18  1764  		bt_dev_err(hdev, "Failed to update handshake hash: %d", ret);
9e92c12afdb6eb Neeraj Sanjay Kale 2025-11-18  1765  		goto free_buf;
9e92c12afdb6eb Neeraj Sanjay Kale 2025-11-18  1766  	}
9e92c12afdb6eb Neeraj Sanjay Kale 2025-11-18  1767  
9e92c12afdb6eb Neeraj Sanjay Kale 2025-11-18  1768  	tls_hello.msg_type = 0;
9e92c12afdb6eb Neeraj Sanjay Kale 2025-11-18  1769  
9e92c12afdb6eb Neeraj Sanjay Kale 2025-11-18  1770  	skb = __hci_cmd_sync(hdev, HCI_NXP_SHI_ENCRYPT, sizeof(tls_hello),
9e92c12afdb6eb Neeraj Sanjay Kale 2025-11-18  1771  			     tls_hello.buf, HCI_CMD_TIMEOUT);
9e92c12afdb6eb Neeraj Sanjay Kale 2025-11-18  1772  	if (IS_ERR(skb)) {
9e92c12afdb6eb Neeraj Sanjay Kale 2025-11-18  1773  		bt_dev_err(hdev, "Host Hello command failed: %ld", PTR_ERR(skb));
9e92c12afdb6eb Neeraj Sanjay Kale 2025-11-18  1774  		ret = PTR_ERR(skb);
9e92c12afdb6eb Neeraj Sanjay Kale 2025-11-18  1775  	}
9e92c12afdb6eb Neeraj Sanjay Kale 2025-11-18  1776  
9e92c12afdb6eb Neeraj Sanjay Kale 2025-11-18  1777  free_buf:
9e92c12afdb6eb Neeraj Sanjay Kale 2025-11-18  1778  	kfree(buf);
9e92c12afdb6eb Neeraj Sanjay Kale 2025-11-18  1779  free_key:
9e92c12afdb6eb Neeraj Sanjay Kale 2025-11-18 @1780  	memset(p.key, 0, p.key_size);
9e92c12afdb6eb Neeraj Sanjay Kale 2025-11-18 @1781  	kfree(p.key);
9e92c12afdb6eb Neeraj Sanjay Kale 2025-11-18  1782  	if (ret)
9e92c12afdb6eb Neeraj Sanjay Kale 2025-11-18  1783  		return ERR_PTR(ret);
9e92c12afdb6eb Neeraj Sanjay Kale 2025-11-18  1784  	else
9e92c12afdb6eb Neeraj Sanjay Kale 2025-11-18  1785  		return skb;
9e92c12afdb6eb Neeraj Sanjay Kale 2025-11-18  1786  }
9e92c12afdb6eb Neeraj Sanjay Kale 2025-11-18  1787  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
