Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 111F66AA2
	for <oe-kbuild@lists.linux.dev>; Sat,  4 Nov 2023 05:10:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hTGNh/1L"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699074636; x=1730610636;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NsF1IZSOYcntvXleOd6pWveWHkN1JgXmWVwyZ68HdY0=;
  b=hTGNh/1Lz5Th/2L48qwU8Q+28ZI26C7t72nWMV0Tgj19AIhTon/FVi1S
   DbsanNUxGkAm5LBj8G/G4cfTwtA8d3ZdH7LcZapIoQHfDkh4F94NCRfuf
   +v1hoelv1ROzgv5hZuDD5hTGzQZnoHF1l3CofyfUEMg/HAkQRdP8AcZ04
   cZ++d/z7RbiFnVdL8xJP8zzzUxDAvtfea7Q5TYMGWcAPprYqHJ1SqgjCy
   5k1kKIdLxeJ+GqFm2+kr8Sj6nfy+fxmzdGQxL/z5jOHYEbW0ts1Uiz416
   pcfoVh0N4koNZJoTUKCjIhfd9/TcQndl31qqRxW+v6Docpca7a6eJaeDl
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10883"; a="369268739"
X-IronPort-AV: E=Sophos;i="6.03,276,1694761200"; 
   d="scan'208";a="369268739"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2023 22:10:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10883"; a="935305581"
X-IronPort-AV: E=Sophos;i="6.03,276,1694761200"; 
   d="scan'208";a="935305581"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 03 Nov 2023 22:10:31 -0700
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qz8vV-0003Se-0w;
	Sat, 04 Nov 2023 05:10:29 +0000
Date: Sat, 4 Nov 2023 13:10:00 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: fs/bcachefs/ec.c:1269 bch2_ec_stripe_head_get() error: we previously
 assumed 'h->s' could be null (see line 1264)
Message-ID: <202311041258.16QpGBvc-lkp@intel.com>
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
CC: linux-kernel@vger.kernel.org
TO: Kent Overstreet <kmo@daterainc.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   2c40c1c6adab90ee4660caf03722b3a3ec67767b
commit: f6b94a3baa956ff10a52a545a9ad60f35e88e683 bcachefs: Refactor stripe creation
date:   12 days ago
:::::: branch date: 3 hours ago
:::::: commit date: 12 days ago
config: x86_64-randconfig-161-20231102 (https://download.01.org/0day-ci/archive/20231104/202311041258.16QpGBvc-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce: (https://download.01.org/0day-ci/archive/20231104/202311041258.16QpGBvc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202311041258.16QpGBvc-lkp@intel.com/

smatch warnings:
fs/bcachefs/ec.c:1269 bch2_ec_stripe_head_get() error: we previously assumed 'h->s' could be null (see line 1264)

vim +1269 fs/bcachefs/ec.c

f6b94a3baa956f Kent Overstreet 2020-07-06  1247  
f6b94a3baa956f Kent Overstreet 2020-07-06  1248  struct ec_stripe_head *bch2_ec_stripe_head_get(struct bch_fs *c,
f6b94a3baa956f Kent Overstreet 2020-07-06  1249  					       unsigned target,
f6b94a3baa956f Kent Overstreet 2020-07-06  1250  					       unsigned algo,
f6b94a3baa956f Kent Overstreet 2020-07-06  1251  					       unsigned redundancy)
f6b94a3baa956f Kent Overstreet 2020-07-06  1252  {
f6b94a3baa956f Kent Overstreet 2020-07-06  1253  	struct closure cl;
f6b94a3baa956f Kent Overstreet 2020-07-06  1254  	struct ec_stripe_head *h;
f6b94a3baa956f Kent Overstreet 2020-07-06  1255  	struct open_bucket *ob;
f6b94a3baa956f Kent Overstreet 2020-07-06  1256  	unsigned i, data_idx = 0;
f6b94a3baa956f Kent Overstreet 2020-07-06  1257  
f6b94a3baa956f Kent Overstreet 2020-07-06  1258  	closure_init_stack(&cl);
f6b94a3baa956f Kent Overstreet 2020-07-06  1259  
f6b94a3baa956f Kent Overstreet 2020-07-06  1260  	h = __bch2_ec_stripe_head_get(c, target, algo, redundancy);
f6b94a3baa956f Kent Overstreet 2020-07-06  1261  	if (!h)
f6b94a3baa956f Kent Overstreet 2020-07-06  1262  		return NULL;
f6b94a3baa956f Kent Overstreet 2020-07-06  1263  
f6b94a3baa956f Kent Overstreet 2020-07-06 @1264  	if (!h->s && ec_new_stripe_alloc(c, h)) {
f6b94a3baa956f Kent Overstreet 2020-07-06  1265  		bch2_ec_stripe_head_put(c, h);
f6b94a3baa956f Kent Overstreet 2020-07-06  1266  		return NULL;
f6b94a3baa956f Kent Overstreet 2020-07-06  1267  	}
f6b94a3baa956f Kent Overstreet 2020-07-06  1268  
f6b94a3baa956f Kent Overstreet 2020-07-06 @1269  	if (!h->s->allocated) {
f6b94a3baa956f Kent Overstreet 2020-07-06  1270  		if (new_stripe_alloc_buckets(c, h)) {
f6b94a3baa956f Kent Overstreet 2020-07-06  1271  			bch2_ec_stripe_head_put(c, h);
f6b94a3baa956f Kent Overstreet 2020-07-06  1272  			h = NULL;
f6b94a3baa956f Kent Overstreet 2020-07-06  1273  			goto out;
f6b94a3baa956f Kent Overstreet 2020-07-06  1274  		}
f6b94a3baa956f Kent Overstreet 2020-07-06  1275  
f6b94a3baa956f Kent Overstreet 2020-07-06  1276  		open_bucket_for_each(c, &h->s->blocks, ob, i) {
f6b94a3baa956f Kent Overstreet 2020-07-06  1277  			data_idx = find_next_zero_bit(h->s->blocks_allocated,
f6b94a3baa956f Kent Overstreet 2020-07-06  1278  						      h->s->nr_data, data_idx);
f6b94a3baa956f Kent Overstreet 2020-07-06  1279  			BUG_ON(data_idx >= h->s->nr_data);
f6b94a3baa956f Kent Overstreet 2020-07-06  1280  
f6b94a3baa956f Kent Overstreet 2020-07-06  1281  			h->s->stripe.key.v.ptrs[data_idx] = ob->ptr;
f6b94a3baa956f Kent Overstreet 2020-07-06  1282  			h->s->data_block_idx[i] = data_idx;
f6b94a3baa956f Kent Overstreet 2020-07-06  1283  			data_idx++;
f6b94a3baa956f Kent Overstreet 2020-07-06  1284  		}
f6b94a3baa956f Kent Overstreet 2020-07-06  1285  
f6b94a3baa956f Kent Overstreet 2020-07-06  1286  		open_bucket_for_each(c, &h->s->parity, ob, i)
f6b94a3baa956f Kent Overstreet 2020-07-06  1287  			h->s->stripe.key.v.ptrs[h->s->nr_data + i] = ob->ptr;
f6b94a3baa956f Kent Overstreet 2020-07-06  1288  
f6b94a3baa956f Kent Overstreet 2020-07-06  1289  		h->s->allocated = true;
f6b94a3baa956f Kent Overstreet 2020-07-06  1290  	}
f6b94a3baa956f Kent Overstreet 2020-07-06  1291  out:
f6b94a3baa956f Kent Overstreet 2020-07-06  1292  	closure_sync(&cl);
f6b94a3baa956f Kent Overstreet 2020-07-06  1293  	return h;
f6b94a3baa956f Kent Overstreet 2020-07-06  1294  }
f6b94a3baa956f Kent Overstreet 2020-07-06  1295  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
