Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA1E920EA33
	for <oe-kbuild@lists.linux.dev>; Fri, 25 Oct 2024 19:24:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729884271; cv=none; b=ibFFUIAOe3BxseZZ66l3vSWpQzI1SMdWiEfTjS2b9dTfKIwLUDjZTre2SBkh/Iz8m3TsivX7xt5NEZOXAaUYdXMgQ5l0TfxjwFS/j+zJSMihmHZe7gIPrBCGAboWkkAUdLmqag4HHnrAfhYdhN0zObI8Gh2A77JYqGTlVOTDzZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729884271; c=relaxed/simple;
	bh=/g6rACdCgbdgP3VKsVm0pVhoAFx2eHYjBzOgBC+Hky4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Rn72w0DzGfSVDoJd8l5SH/TWWingqO0M2bTzyaoaAxx+Wm6xu1S4F9dRoF+kXlAdJxfA/L8PrSjYs51sSNcPG4S64eKOlhudSwlBeaZw/xw3cZrtGXzO+slnzUJT2ed59Xi7+MYKyOFd7gq1c4vSPxUJ4woV4mWyIyxkt/3BnSM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jhfkA7W7; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jhfkA7W7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729884269; x=1761420269;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/g6rACdCgbdgP3VKsVm0pVhoAFx2eHYjBzOgBC+Hky4=;
  b=jhfkA7W73Y9gPeStPAWAj5wqqQf3N/+Hx/7gN3gfaX9naVbJBfx3IHiK
   h0VE61JI3TNGkOg6tMSB4OtUobqBayKNqP7lucgnNFiNa/v2HvihuKKYb
   Bvs3ifq8j0ID8igr9k3bKpQhGg6mtG50pdMWNe0r77WBoOoLRk6+cn5MG
   AYeTEr44Jnm7xqKn/c2Aig301DqlEN743p6abgZzcykUjyywIPgAK2uIM
   K5wzTmpK/NXYK5RgJwzI7ZT3pWdN5H0BSNXK7gyqNZCUvkKayaf/Rzgzl
   YbaynHU8idARqseR+tTV0Hx8ySgYzcXqEuy5mAfv0/LpdS+JNZogpTAfg
   Q==;
X-CSE-ConnectionGUID: Xg8bO2WVQAq5ITPTFV+zxg==
X-CSE-MsgGUID: PyDJqcDpTWSJCpUAtpEQ5Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="47025722"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="47025722"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2024 12:24:29 -0700
X-CSE-ConnectionGUID: SL5WELQvRVq3DMTlWcbgwA==
X-CSE-MsgGUID: OrxJuM8JR26P4ArL/nB9KQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,232,1725346800"; 
   d="scan'208";a="81848000"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 25 Oct 2024 12:24:27 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t4Pv6-000Yo0-2P;
	Fri, 25 Oct 2024 19:24:24 +0000
Date: Sat, 26 Oct 2024 03:24:17 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH net-next 1/3] net: dsa: vsc73xx: implement transmit via
 control interface
Message-ID: <202410260359.mzTlhkNk-lkp@intel.com>
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
In-Reply-To: <20241020205452.2660042-1-paweldembicki@gmail.com>
References: <20241020205452.2660042-1-paweldembicki@gmail.com>
TO: Pawel Dembicki <paweldembicki@gmail.com>
TO: netdev@vger.kernel.org
CC: Linus Walleij <linus.walleij@linaro.org>
CC: Pawel Dembicki <paweldembicki@gmail.com>
CC: Andrew Lunn <andrew@lunn.ch>
CC: Florian Fainelli <f.fainelli@gmail.com>
CC: Vladimir Oltean <olteanv@gmail.com>
CC: Eric Dumazet <edumazet@google.com>
CC: Jakub Kicinski <kuba@kernel.org>
CC: Paolo Abeni <pabeni@redhat.com>
CC: linux-kernel@vger.kernel.org

Hi Pawel,

kernel test robot noticed the following build warnings:

[auto build test WARNING on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Pawel-Dembicki/net-dsa-vsc73xx-implement-packet-reception-via-control-interface/20241021-050041
base:   net-next/main
patch link:    https://lore.kernel.org/r/20241020205452.2660042-1-paweldembicki%40gmail.com
patch subject: [PATCH net-next 1/3] net: dsa: vsc73xx: implement transmit via control interface
:::::: branch date: 5 days ago
:::::: commit date: 5 days ago
config: arm-randconfig-r072-20241024 (https://download.01.org/0day-ci/archive/20241026/202410260359.mzTlhkNk-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 5886454669c3c9026f7f27eab13509dd0241f2d6)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202410260359.mzTlhkNk-lkp@intel.com/

smatch warnings:
drivers/net/dsa/vitesse-vsc73xx-core.c:796 vsc73xx_inject_frame() error: uninitialized symbol 'ret'.

vim +/ret +796 drivers/net/dsa/vitesse-vsc73xx-core.c

ffd38d14c3235e Pawel Dembicki 2024-10-20  750  
ffd38d14c3235e Pawel Dembicki 2024-10-20  751  static int
ffd38d14c3235e Pawel Dembicki 2024-10-20  752  vsc73xx_inject_frame(struct vsc73xx *vsc, int port, struct sk_buff *skb)
ffd38d14c3235e Pawel Dembicki 2024-10-20  753  {
ffd38d14c3235e Pawel Dembicki 2024-10-20  754  	struct vsc73xx_ifh *ifh;
ffd38d14c3235e Pawel Dembicki 2024-10-20  755  	u32 length, i, count;
ffd38d14c3235e Pawel Dembicki 2024-10-20  756  	u32 *buf;
ffd38d14c3235e Pawel Dembicki 2024-10-20  757  	int ret;
ffd38d14c3235e Pawel Dembicki 2024-10-20  758  
ffd38d14c3235e Pawel Dembicki 2024-10-20  759  	if (skb->len + VSC73XX_IFH_SIZE < 64)
ffd38d14c3235e Pawel Dembicki 2024-10-20  760  		length = 64;
ffd38d14c3235e Pawel Dembicki 2024-10-20  761  	else
ffd38d14c3235e Pawel Dembicki 2024-10-20  762  		length = skb->len + VSC73XX_IFH_SIZE;
ffd38d14c3235e Pawel Dembicki 2024-10-20  763  
ffd38d14c3235e Pawel Dembicki 2024-10-20  764  	count = DIV_ROUND_UP(length, 8);
ffd38d14c3235e Pawel Dembicki 2024-10-20  765  	buf = kzalloc(count * 8, GFP_KERNEL);
ffd38d14c3235e Pawel Dembicki 2024-10-20  766  	memset(buf, 0, sizeof(buf));
ffd38d14c3235e Pawel Dembicki 2024-10-20  767  
ffd38d14c3235e Pawel Dembicki 2024-10-20  768  	ifh = (struct vsc73xx_ifh *)buf;
ffd38d14c3235e Pawel Dembicki 2024-10-20  769  	ifh->frame_length = skb->len;
ffd38d14c3235e Pawel Dembicki 2024-10-20  770  	ifh->magic = VSC73XX_IFH_MAGIC;
ffd38d14c3235e Pawel Dembicki 2024-10-20  771  
ffd38d14c3235e Pawel Dembicki 2024-10-20  772  	skb_copy_and_csum_dev(skb, (u8 *)(buf + 2));
ffd38d14c3235e Pawel Dembicki 2024-10-20  773  
ffd38d14c3235e Pawel Dembicki 2024-10-20  774  	for (i = 0; i < count; i++) {
ffd38d14c3235e Pawel Dembicki 2024-10-20  775  		ret = vsc73xx_write_tx_fifo(vsc, port, buf[2 * i],
ffd38d14c3235e Pawel Dembicki 2024-10-20  776  					    buf[2 * i + 1]);
ffd38d14c3235e Pawel Dembicki 2024-10-20  777  		if (ret) {
ffd38d14c3235e Pawel Dembicki 2024-10-20  778  			/* Clear buffer after error */
ffd38d14c3235e Pawel Dembicki 2024-10-20  779  			vsc73xx_update_bits(vsc, VSC73XX_BLOCK_MAC, port,
ffd38d14c3235e Pawel Dembicki 2024-10-20  780  					    VSC73XX_MISCFIFO,
ffd38d14c3235e Pawel Dembicki 2024-10-20  781  					    VSC73XX_MISCFIFO_REWIND_CPU_TX,
ffd38d14c3235e Pawel Dembicki 2024-10-20  782  					    VSC73XX_MISCFIFO_REWIND_CPU_TX);
ffd38d14c3235e Pawel Dembicki 2024-10-20  783  			goto err;
ffd38d14c3235e Pawel Dembicki 2024-10-20  784  		}
ffd38d14c3235e Pawel Dembicki 2024-10-20  785  	}
ffd38d14c3235e Pawel Dembicki 2024-10-20  786  
ffd38d14c3235e Pawel Dembicki 2024-10-20  787  	vsc73xx_write(vsc, VSC73XX_BLOCK_MAC, port, VSC73XX_MISCFIFO,
ffd38d14c3235e Pawel Dembicki 2024-10-20  788  		      VSC73XX_MISCFIFO_CPU_TX);
ffd38d14c3235e Pawel Dembicki 2024-10-20  789  
ffd38d14c3235e Pawel Dembicki 2024-10-20  790  	skb_tx_timestamp(skb);
ffd38d14c3235e Pawel Dembicki 2024-10-20  791  
ffd38d14c3235e Pawel Dembicki 2024-10-20  792  	skb->dev->stats.tx_packets++;
ffd38d14c3235e Pawel Dembicki 2024-10-20  793  	skb->dev->stats.tx_bytes += skb->len;
ffd38d14c3235e Pawel Dembicki 2024-10-20  794  err:
ffd38d14c3235e Pawel Dembicki 2024-10-20  795  	kfree(buf);
ffd38d14c3235e Pawel Dembicki 2024-10-20 @796  	return ret;
ffd38d14c3235e Pawel Dembicki 2024-10-20  797  }
ffd38d14c3235e Pawel Dembicki 2024-10-20  798  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
