Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B49FD281
	for <oe-kbuild@lists.linux.dev>; Mon, 27 Nov 2023 08:43:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Arp/sURa"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-32f737deedfso2395729f8f.3
        for <oe-kbuild@lists.linux.dev>; Mon, 27 Nov 2023 00:43:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701074612; x=1701679412; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2xnOF1CxvID+dtjKdZtlw3NSe8y8zSJxuj2ZIPYY3uU=;
        b=Arp/sURaJLAjfWuqOq8fmh8egfgl9RlVy27FFRqXUswubBp9kjjWIIJ3E0WfozR4Rv
         1c6YSwYz1igCL3Ubfbyts731qTdQqC0nfSd7GXWBUTbyLEd/+SKvIgNtqIjnBF28Jxpm
         d+Ie8xkAhpLMDL6srLfJTWZE19WVPg+pANQhQ3RXg56IRKxNywdGCUIACHKcjZyRdobF
         4LAqW2Ybf1LAr2tYL4WHu2SI+zYQc9r46yeODsVufDaKQpHBbeuEyq0PUDt7VVLvllBw
         mkyXjtqLGxchH41lj8qlqdarBGWqFpwbS9REw+9VPE9MyZv1ophd6FSXtWALKl0tZVKN
         5qEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701074612; x=1701679412;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2xnOF1CxvID+dtjKdZtlw3NSe8y8zSJxuj2ZIPYY3uU=;
        b=oZM3K4ceIOO0CClbehVSWquWtSyRaMkW1mzPa4IsDhYepsP+WfB2W82OpAcl1fAQUJ
         SfdKVsAobY2r0Au00pIz9AnioRB7VSciNNs533CR8gA4w5f82AqlQZGbGa0J6/Eaj5RZ
         c3YkVoGT+WXXC/cJZu1rLtVe1cqg5AqPALTtwgMUDUv34NztYyKBAZkwkHBXGxvAj+wF
         /5pamWrPaanYbCjmhW6PBR9QHSjrW90FE+B/0i0t5qkUJ2uTiBKObPvaV65KGzgkirtO
         YNqQlsp0e4R5ruF05CiolmFV27ADVR98r5Win254FEHST3B5DsSih17StMacwmSM8Mej
         zwxg==
X-Gm-Message-State: AOJu0YzmcB+jeNYJ6bHZW8U5s+cpqNjWkgqytCGo1Ng4noExdlVvur4F
	w3aZzLYqLXOPcg4ndNjVXxF2oFoDXLUKijyZhMs=
X-Google-Smtp-Source: AGHT+IEk54NjVWopu9izapGPvppfJzH7fiDJYjBKBIuzRtGaobPqV2lbJB4Y3jcA3sJh2RPzNIxL/A==
X-Received: by 2002:a5d:4f8c:0:b0:332:ca1a:c3a0 with SMTP id d12-20020a5d4f8c000000b00332ca1ac3a0mr7700858wru.52.1701074612004;
        Mon, 27 Nov 2023 00:43:32 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id e15-20020a5d594f000000b00332fda15055sm3362220wri.111.2023.11.27.00.43.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Nov 2023 00:43:31 -0800 (PST)
From: Dan Carpenter <dan.carpenter@linaro.org>
X-Google-Original-From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 27 Nov 2023 11:43:29 +0300
To: oe-kbuild@lists.linux.dev, Ivan Vecera <ivecera@redhat.com>,
	intel-wired-lan@lists.osuosl.org
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Jesse Brandeburg <jesse.brandeburg@intel.com>,
	Tony Nguyen <anthony.l.nguyen@intel.com>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	linux-kernel@vger.kernel.org,
	Jacob Keller <jacob.e.keller@intel.com>,
	Wojciech Drewek <wojciech.drewek@intel.com>,
	Simon Horman <horms@kernel.org>, mschmidt@redhat.com,
	netdev@vger.kernel.org
Subject: Re: [PATCH v5 4/5] i40e: Fix broken support for floating VEBs
Message-ID: <25111205-a895-46a2-b53f-49e29ba41b16@suswa.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231124150343.81520-5-ivecera@redhat.com>

Hi Ivan,

kernel test robot noticed the following build warnings:

url:    https://github.com/intel-lab-lkp/linux/commits/Ivan-Vecera/i40e-Use-existing-helper-to-find-flow-director-VSI/20231124-230616
base:   https://git.kernel.org/pub/scm/linux/kernel/git/tnguy/next-queue.git dev-queue
patch link:    https://lore.kernel.org/r/20231124150343.81520-5-ivecera%40redhat.com
patch subject: [PATCH v5 4/5] i40e: Fix broken support for floating VEBs
config: x86_64-randconfig-161-20231127 (https://download.01.org/0day-ci/archive/20231127/202311270851.Ie6aegcS-lkp@intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce: (https://download.01.org/0day-ci/archive/20231127/202311270851.Ie6aegcS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202311270851.Ie6aegcS-lkp@intel.com/

New smatch warnings:
drivers/net/ethernet/intel/i40e/i40e_main.c:14743 i40e_veb_release() error: potentially dereferencing uninitialized 'vsi'.

Old smatch warnings:
[ low confidence ]
drivers/net/ethernet/intel/i40e/i40e_main.c:5966 i40e_set_bw_limit() warn: error code type promoted to positive: 'speed'
drivers/net/ethernet/intel/i40e/i40e_main.c:13476 i40e_queue_pair_toggle_rings() warn: missing error code? 'ret'
drivers/net/ethernet/intel/i40e/i40e_main.c:14272 i40e_vsi_setup_vectors() warn: missing error code? 'ret'
drivers/net/ethernet/intel/i40e/i40e_main.c:15566 i40e_init_recovery_mode() warn: 'vsi->netdev' from register_netdev() not released on lines: 15566.

vim +/vsi +14743 drivers/net/ethernet/intel/i40e/i40e_main.c

41c445ff0f482bb Jesse Brandeburg 2013-09-11  14715  void i40e_veb_release(struct i40e_veb *veb)
41c445ff0f482bb Jesse Brandeburg 2013-09-11  14716  {
0aab77d67d37d09 Ivan Vecera      2023-11-24  14717  	struct i40e_vsi *vsi, *vsi_it;
41c445ff0f482bb Jesse Brandeburg 2013-09-11  14718  	struct i40e_pf *pf;
41c445ff0f482bb Jesse Brandeburg 2013-09-11  14719  	int i, n = 0;
41c445ff0f482bb Jesse Brandeburg 2013-09-11  14720  
41c445ff0f482bb Jesse Brandeburg 2013-09-11  14721  	pf = veb->pf;
41c445ff0f482bb Jesse Brandeburg 2013-09-11  14722  
41c445ff0f482bb Jesse Brandeburg 2013-09-11  14723  	/* find the remaining VSI and check for extras */
0aab77d67d37d09 Ivan Vecera      2023-11-24  14724  	i40e_pf_for_each_vsi(pf, i, vsi_it)
0aab77d67d37d09 Ivan Vecera      2023-11-24  14725  		if (vsi_it->uplink_seid == veb->seid) {
93a1bc91a1ccc5a Ivan Vecera      2023-11-24  14726  			if (vsi_it->flags & I40E_VSI_FLAG_VEB_OWNER)
0aab77d67d37d09 Ivan Vecera      2023-11-24  14727  				vsi = vsi_it;

Do we always find a vsi?  Presumably, yes, but it's not obvious just
from reading this function.

41c445ff0f482bb Jesse Brandeburg 2013-09-11  14728  			n++;
41c445ff0f482bb Jesse Brandeburg 2013-09-11  14729  		}
0aab77d67d37d09 Ivan Vecera      2023-11-24  14730  
93a1bc91a1ccc5a Ivan Vecera      2023-11-24  14731  	/* Floating VEB has to be empty and regular one must have
93a1bc91a1ccc5a Ivan Vecera      2023-11-24  14732  	 * single owner VSI.
93a1bc91a1ccc5a Ivan Vecera      2023-11-24  14733  	 */
93a1bc91a1ccc5a Ivan Vecera      2023-11-24  14734  	if ((veb->uplink_seid && n != 1) || (!veb->uplink_seid && n != 0)) {
41c445ff0f482bb Jesse Brandeburg 2013-09-11  14735  		dev_info(&pf->pdev->dev,
41c445ff0f482bb Jesse Brandeburg 2013-09-11  14736  			 "can't remove VEB %d with %d VSIs left\n",
41c445ff0f482bb Jesse Brandeburg 2013-09-11  14737  			 veb->seid, n);
41c445ff0f482bb Jesse Brandeburg 2013-09-11  14738  		return;
41c445ff0f482bb Jesse Brandeburg 2013-09-11  14739  	}
41c445ff0f482bb Jesse Brandeburg 2013-09-11  14740  
93a1bc91a1ccc5a Ivan Vecera      2023-11-24  14741  	/* For regular VEB move the owner VSI to uplink VEB */
41c445ff0f482bb Jesse Brandeburg 2013-09-11  14742  	if (veb->uplink_seid) {
93a1bc91a1ccc5a Ivan Vecera      2023-11-24 @14743  		vsi->flags &= ~I40E_VSI_FLAG_VEB_OWNER;
                                                                ^^^^^^^^^^

41c445ff0f482bb Jesse Brandeburg 2013-09-11  14744  		vsi->uplink_seid = veb->uplink_seid;
41c445ff0f482bb Jesse Brandeburg 2013-09-11  14745  		if (veb->uplink_seid == pf->mac_seid)
41c445ff0f482bb Jesse Brandeburg 2013-09-11  14746  			vsi->veb_idx = I40E_NO_VEB;
41c445ff0f482bb Jesse Brandeburg 2013-09-11  14747  		else
41c445ff0f482bb Jesse Brandeburg 2013-09-11  14748  			vsi->veb_idx = veb->veb_idx;
41c445ff0f482bb Jesse Brandeburg 2013-09-11  14749  	}
41c445ff0f482bb Jesse Brandeburg 2013-09-11  14750  
41c445ff0f482bb Jesse Brandeburg 2013-09-11  14751  	i40e_aq_delete_element(&pf->hw, veb->seid, NULL);
41c445ff0f482bb Jesse Brandeburg 2013-09-11  14752  	i40e_veb_clear(veb);
41c445ff0f482bb Jesse Brandeburg 2013-09-11  14753  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

