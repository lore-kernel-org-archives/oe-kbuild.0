Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7669320FC
	for <oe-kbuild@lists.linux.dev>; Tue,  7 Feb 2023 10:57:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675767420; x=1707303420;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=63udTvaMaLusKWEXi8ycMpNNH8X0TKhEhvwW3Ybe8L4=;
  b=MkfSBIQtWP0r7MjWVd3I0q0l9brqObMGHt8/swLCIHPKu/ofio6FnTTw
   ABO8F87eFpXzLsA9VFlVtbkkhMCclycJahmI4MsWJDK6kaWwrmorQV1i1
   YT548Bwy9YARi5FFrfLSfSE89JDDuo3inCExAFh2FFO+i/M7RgbSl9x4P
   3k+t+nuzvIqrVu5VSZki9v53+3a76wxEOnvwUzX6prZbmrum0T5+tgLNY
   aqgznNGkyUfnDMk0FVg2i7EAWV8Hh7hpnLt1/g5llwkMyNLqNy1fZlY2M
   o38nf9gRlgAfELPTXeRt434quGHKpPEsACOyfyYmpzP3LflihScplm5lL
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10613"; a="356845517"
X-IronPort-AV: E=Sophos;i="5.97,278,1669104000"; 
   d="scan'208";a="356845517"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Feb 2023 02:56:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10613"; a="616765845"
X-IronPort-AV: E=Sophos;i="5.97,278,1669104000"; 
   d="scan'208";a="616765845"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 07 Feb 2023 02:56:57 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pPLei-0003TK-1y;
	Tue, 07 Feb 2023 10:56:56 +0000
Date: Tue, 7 Feb 2023 18:56:28 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v4 3/4] crypto/net/ipv6: sr: Switch to using crypto_pool
Message-ID: <202302071833.k6CihGFl-lkp@intel.com>
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
In-Reply-To: <20230118214111.394416-4-dima@arista.com>
References: <20230118214111.394416-4-dima@arista.com>
TO: Dmitry Safonov <dima@arista.com>
TO: linux-kernel@vger.kernel.org
TO: David Ahern <dsahern@kernel.org>
TO: Eric Dumazet <edumazet@google.com>
TO: Herbert Xu <herbert@gondor.apana.org.au>
TO: Jakub Kicinski <kuba@kernel.org>
TO: "David S. Miller" <davem@davemloft.net>
CC: netdev@vger.kernel.org
CC: Dmitry Safonov <dima@arista.com>
CC: Andy Lutomirski <luto@amacapital.net>
CC: Bob Gilligan <gilligan@arista.com>
CC: Hideaki YOSHIFUJI <yoshfuji@linux-ipv6.org>
CC: Leonard Crestez <cdleonard@gmail.com>
CC: Paolo Abeni <pabeni@redhat.com>
CC: Salam Noureddine <noureddine@arista.com>
CC: linux-crypto@vger.kernel.org

Hi Dmitry,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on c1649ec55708ae42091a2f1bca1ab49ecd722d55]

url:    https://github.com/intel-lab-lkp/linux/commits/Dmitry-Safonov/crypto-Introduce-crypto_pool/20230119-054258
base:   c1649ec55708ae42091a2f1bca1ab49ecd722d55
patch link:    https://lore.kernel.org/r/20230118214111.394416-4-dima%40arista.com
patch subject: [PATCH v4 3/4] crypto/net/ipv6: sr: Switch to using crypto_pool
:::::: branch date: 3 weeks ago
:::::: commit date: 3 weeks ago
config: s390-randconfig-m041-20230206 (https://download.01.org/0day-ci/archive/20230207/202302071833.k6CihGFl-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>

smatch warnings:
net/ipv6/seg6.c:539 seg6_init() warn: ignoring unreachable code.

vim +539 net/ipv6/seg6.c

4f4853dc1c9c19 David Lebrun   2016-11-08  532  
915d7e5e5930b4 David Lebrun   2016-11-08  533  	pr_info("Segment Routing with IPv6\n");
915d7e5e5930b4 David Lebrun   2016-11-08  534  
915d7e5e5930b4 David Lebrun   2016-11-08  535  out:
915d7e5e5930b4 David Lebrun   2016-11-08  536  	return err;
754f6619437c57 Dmitry Safonov 2023-01-18  537  
46738b1317e169 David Lebrun   2016-11-15  538  #ifdef CONFIG_IPV6_SEG6_LWTUNNEL
d1df6fd8a1d22d David Lebrun   2017-08-05 @539  	seg6_local_exit();
754f6619437c57 Dmitry Safonov 2023-01-18  540  out_unregister_iptun:
4f4853dc1c9c19 David Lebrun   2016-11-08  541  	seg6_iptunnel_exit();
4f4853dc1c9c19 David Lebrun   2016-11-08  542  #endif
46738b1317e169 David Lebrun   2016-11-15  543  #ifdef CONFIG_IPV6_SEG6_LWTUNNEL
6c8702c60b8865 David Lebrun   2016-11-08  544  out_unregister_pernet:
6c8702c60b8865 David Lebrun   2016-11-08  545  	unregister_pernet_subsys(&ip6_segments_ops);
46738b1317e169 David Lebrun   2016-11-15  546  #endif
915d7e5e5930b4 David Lebrun   2016-11-08  547  out_unregister_genl:
915d7e5e5930b4 David Lebrun   2016-11-08  548  	genl_unregister_family(&seg6_genl_family);
915d7e5e5930b4 David Lebrun   2016-11-08  549  	goto out;
915d7e5e5930b4 David Lebrun   2016-11-08  550  }
915d7e5e5930b4 David Lebrun   2016-11-08  551  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
