Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53D6623AA;
	Tue,  7 Feb 2023 11:40:11 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id bg13-20020a05600c3c8d00b003d9712b29d2so12958772wmb.2;
        Tue, 07 Feb 2023 03:40:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=CVUPLdLOw/UB93NtGlM7IQoioXa06+RQkko/zl9JthU=;
        b=VJCAqSwV8SEb9dTPQAkuvQc6ycFufPKuoCv64JlqglyOojgkokfgfcYkqfLlwXNQpn
         esBze4kx7maIBe9Gj7fO5/maQRe4j0VGoK6sRo56hQz4BwofN0iety2nxvczkCiWUuDF
         vx2BzS54uej4q+inVIiGJcyLBFp6riToS9IfGgzskm1w6eTnB3u9UY/cSW0+quzLoe1Q
         o8CEduKXROvELtrLaEm2ONJeFkOt9y6LvOnCjOPIpRWq1vO5bmuZRWy82uQsqcrByTJk
         3iiiSBzX1YSkZ14m5X24o6zgleo2ItqDxpLCTUR8WWLSz9ti7ekw5P/7UPcQxHf4+gH/
         86EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CVUPLdLOw/UB93NtGlM7IQoioXa06+RQkko/zl9JthU=;
        b=Mv/BTrYmtm8hEPmqNP8TWf/tbiTTk+IujrtmUkaPXlkQWrpk81F/L3i0/IlH4NE0Jl
         8j1FZQwpBQGI10YCShlJsUAillthdMBjMOrDZ98B6WR7k36lOLPR+uRhiiMYiJXqb02P
         Bh5lWn9Cb13W2LOu/+sRi0ecchqgqIUdEFq1tpG268T7o7FwBEqycAr6JT9419UH8Bfd
         BEprh+VrEXEsZwI1Fvuf3pIyy5PBtpslB9qSMGFOIJ35ds6xz86kz6wBHUuHRFxFUeJk
         KbeHaegdnQu0ezqtL8hoAA2Si+D4ozoqfLxZJYXcX5dCcW+65ln3wL9O6vRyEJtFM85T
         nRRg==
X-Gm-Message-State: AO0yUKUb34ZuDSkqAdIuSGdzFF0/66xhxw3iPwNVOg4XCiwLZVFY+XUp
	zdZTxjq2jKVW5FXkh6lkjvYIUBiSMjHzDAba
X-Google-Smtp-Source: AK7set+O8Z1wCa2vCtlaMwiUEB+EQ/2JqzGwSRInIaDGWnSxMWM7KwBYn1o29gzma5ZL7XOjOqPUow==
X-Received: by 2002:a05:600c:3d8b:b0:3df:fd8c:8f2f with SMTP id bi11-20020a05600c3d8b00b003dffd8c8f2fmr2797728wmb.40.1675770009336;
        Tue, 07 Feb 2023 03:40:09 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id o35-20020a05600c512300b003cffd3c3d6csm14762782wms.12.2023.02.07.03.40.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Feb 2023 03:40:08 -0800 (PST)
Date: Tue, 7 Feb 2023 14:40:04 +0300
From: Dan Carpenter <error27@gmail.com>
To: oe-kbuild@lists.linux.dev, Dmitry Safonov <dima@arista.com>,
	linux-kernel@vger.kernel.org, David Ahern <dsahern@kernel.org>,
	Eric Dumazet <edumazet@google.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Jakub Kicinski <kuba@kernel.org>,
	"David S. Miller" <davem@davemloft.net>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev, netdev@vger.kernel.org,
	Dmitry Safonov <dima@arista.com>,
	Andy Lutomirski <luto@amacapital.net>,
	Bob Gilligan <gilligan@arista.com>,
	Hideaki YOSHIFUJI <yoshfuji@linux-ipv6.org>,
	Leonard Crestez <cdleonard@gmail.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Salam Noureddine <noureddine@arista.com>,
	linux-crypto@vger.kernel.org
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
In-Reply-To: <20230118214111.394416-4-dima@arista.com>
Message-ID: <20230207114004.PUv8JvsUB5LmIzOtstgkISnlsZP_IDg_ti-kDAfGb7w@z>

Hi Dmitry,

url:    https://github.com/intel-lab-lkp/linux/commits/Dmitry-Safonov/crypto-Introduce-crypto_pool/20230119-054258
base:   c1649ec55708ae42091a2f1bca1ab49ecd722d55
patch link:    https://lore.kernel.org/r/20230118214111.394416-4-dima%40arista.com
patch subject: [PATCH v4 3/4] crypto/net/ipv6: sr: Switch to using crypto_pool
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

Not a bug.  Just dead code.  Some people like to store dead code here
for later, but it's not a common thing...

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

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

