Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com [74.125.228.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6425B404BF9
	for <oe-kbuild@lists.linux.dev>; Wed, 23 Sep 2026 08:37:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790152674; cv=none; b=a4hZ77VAdbAHpDYbTPRANbUETPnAIr+6Qg2iGM8WoUMWawCdPOH7LLMnhFVThh4QGFX9CPk5SOVFt+o2pKoB2rzbI0xgyL1GRP65mGk1Z5O8WVORh+NEM9aJm0Gmw/WonBlhALXGGHBdzmHvZEeymH07RIjwNug6ZdhyLw5GSyg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790152674; c=relaxed/simple;
	bh=uRjcUxeEQmV6ec9npQjX5uza5dm9WIobiw1akWmO/XA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qN+fP4xg08j8lBqtO70DsYEDROjk/S37esz25nD5yv8pv264GcRqQ6zdSlqQaOXXcezVtaEugU6ZfNzSpitkwD2LTbhFuE4crsu4tYWbVsKsQ+uQobq3F8zeASUg5VvfssIqKpsyMLPb0DpXvqXNjd4Q9CG/JQH86jWt2iPb2zk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lIQcyBh4; arc=none smtp.client-ip=74.125.228.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lIQcyBh4"
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c254f9f7dbeso78121566b.0
        for <oe-kbuild@lists.linux.dev>; Wed, 23 Sep 2026 01:37:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790152655; x=1790757455; darn=lists.linux.dev;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pxCaWNZSnkou9hfi8CjdDjOclTIQWCL/F4nwtl/yEwI=;
        b=lIQcyBh4bR9Ep8MG75eQyS182ShKWK1OOrdogXYOe4I0MsFTVKsU3niFIz0c4VWVlm
         2REUlMdKK6cvCDVls54Lx9k1DK1kE7/f4UZg7gymTj+vIS8VJp37d5yZHtEc6ng+dXDe
         rLCfkTcfgzxDutxFjlzVH5DBl41E/a1heC7mg/E9qcffNKF52DYNe1Oq1KDCw48AWzO8
         kuk5ONO0wYlEJrffkhGCB1EPF67PNbBxFVt+O4jvvJjLYBc+CWEjgY79fPe1iyTj9LdM
         NhMAXQRBwQvFPctoR9aTKAKwSeeFc0wMB1PSUbUUTymy5v117W4rPK2s6vRPxZQpwf8I
         INOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790152655; x=1790757455;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pxCaWNZSnkou9hfi8CjdDjOclTIQWCL/F4nwtl/yEwI=;
        b=R6sQ2j1877PgHT90mvJjO/sZdN252GH7abFPCiipJlmP/kL00r4ugDqeBSEByng+dQ
         6RvSGEjkiHlc6Wqt0FHKQb5Rd2wBzSeialPn62mm5vNC2CDx0bC8CrwZfXg4zMBeau3j
         foMp9mpeMY7iMu8+XNqHjXeRHuzFDQBiT925o+H9915JZVGWhQRko1ICIXAxPV5J90qq
         ZM12h90sePOA9yGO6CmI//B+VZAPqyXLfdo0VLu2+QuZOYmTrgaH1ZdRRBGeziQ4IVNB
         1gUJvVGCAnk5GIcuJbxoqhpE9ykBUQMAvaRxZhmdHBNH5mOItPyA7XqRPdQfqWjjgmXU
         oUEQ==
X-Gm-Message-State: AFuF++lbXwdAvvRr/f2To0tmvnYD2r747pd8oct6W5SitZXcHiBni5k/
	nmIyW+hKYBRpI5ezC8Bno0mHDG0+ZDzSgYsEsNZy2fEDqSXwlhhoEkIi3titoH2YipWt8g==
X-Gm-Gg: AYBFou2QMLM9Gcbr7CcybpJMvG5rBshVYUxMUG3XAdaV3b5b6w10EP3+YDO+RFbRJ7W
	4K1RE1WwycI9HmlNWDgg2OQrG69uhgqaTX+sbPyvuSThYucHjujTx83/etGcubVASRLpYbWl5LJ
	oXekbnGY0D5QjCqU5df0RicYB1Gc4eReLijtXb0ET/FNkJFhqEqiRFfB3SjVClZYxQp6+cBZe90
	MfYHz7lN3D36E9MHZ3Agh6//NXgXvhZiiQGQ0aHrF6bp8bG8o8qNULBO3cCKj2zTZS0gdg3oIxk
	AurWJmGK0xyq4M2w+5HL6HD/mPxwmh2AhS1LDBcz+sPFcLX2L4x5LkVJEuOjjKeLZMASQufwCsi
	K2rSi/bHYy/XWzQo5OG5FU7/CzGqbSOfwC4U2TeQ164IFf4BOykQy4yoxDRwcZfdfLPKpyQzHkn
	kVwd66y35zYjst85WVNgayo9lgLhireLgzxedK0+KVvpqMYyCNXp5CbqAUkG2/tzkgKFs=
X-Received: by 2002:a17:907:e84b:b0:c25:cb7e:1cc9 with SMTP id a640c23a62f3a-c2aade3f821mr149296466b.7.1790152654819;
        Wed, 23 Sep 2026 01:37:34 -0700 (PDT)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2aae6b9b2bsm72131866b.50.2026.09.23.01.37.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 01:37:33 -0700 (PDT)
Date: Wed, 23 Sep 2026 11:37:30 +0300
From: Dan Carpenter <error27@gmail.com>
To: oe-kbuild@lists.linux.dev, Jim Cromie <jim.cromie@gmail.com>,
	=?utf-8?Q?=C5=81ukasz?= Bartosik <ukaszb@chromium.org>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [jimc:m10 35/44] lib/dynamic_debug.c:854
 param_set_dyndbg_module_classes() error: we previously assumed 'map' could
 be null (see line 841)
Message-ID: <202609230952.6jFrseQb-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Message-ID: <20260923083730.tU3TSNUKFwhCP2uxI_sBnSS1CLU4Zz7LjXFByA6DyzQ@z>

tree:   https://github.com/jimc/linux.git m10
head:   f95e4f1e4ce035c9b5f8da68c66d83f2452d92d5
commit: feb8ec0044ac67921562346a4a6b831204667ea9 [35/44] dyndbg: resolve "protection" of class'd pr_debug
config: x86_64-randconfig-2200-20260923 (https://download.01.org/0day-ci/archive/20260923/202609230952.6jFrseQb-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202609230952.6jFrseQb-lkp@intel.com/

smatch warnings:
lib/dynamic_debug.c:854 param_set_dyndbg_module_classes() error: we previously assumed 'map' could be null (see line 841)

vim +/map +854 lib/dynamic_debug.c

7f10c4fc568572 Jim Cromie 2025-11-18  832  static int param_set_dyndbg_module_classes(const char *instr,
7f10c4fc568572 Jim Cromie 2025-11-18  833  					   const struct kernel_param *kp,
7f10c4fc568572 Jim Cromie 2025-11-18  834  					   const char *mod_name)
b9400852c0801a Jim Cromie 2022-09-04  835  {
feb8ec0044ac67 Jim Cromie 2025-11-18  836  	struct ddebug_class_param *dcp = kp->arg;
feb8ec0044ac67 Jim Cromie 2025-11-18  837  	struct ddebug_class_map *map = dcp->map;
62b32b2a95ef1c Jim Cromie 2025-11-18  838  	u32 inrep, new_bits, old_bits, old_val;
b9400852c0801a Jim Cromie 2022-09-04  839  	int rc, totct = 0;
b9400852c0801a Jim Cromie 2022-09-04  840  
feb8ec0044ac67 Jim Cromie 2025-11-18 @841  	if (map && !map->controlling_param)
                                                    ^^^
Can map really be NULL?

feb8ec0044ac67 Jim Cromie 2025-11-18  842  		map->controlling_param = dcp;
feb8ec0044ac67 Jim Cromie 2025-11-18  843  
62b32b2a95ef1c Jim Cromie 2025-11-18  844  	rc = kstrtou32(instr, 0, &inrep);
b9400852c0801a Jim Cromie 2022-09-04  845  	if (rc) {
cec8bafd130370 Jim Cromie 2025-11-18  846  		int len = strcspn(instr, "\n");
cec8bafd130370 Jim Cromie 2025-11-18  847  
cec8bafd130370 Jim Cromie 2025-11-18  848  		pr_err("expecting numeric input, not: %.*s > %s\n",
cec8bafd130370 Jim Cromie 2025-11-18  849  		       len, instr, KP_NAME(kp));
b9400852c0801a Jim Cromie 2022-09-04  850  		return -EINVAL;
b9400852c0801a Jim Cromie 2022-09-04  851  	}
d88925c4b39c80 Jim Cromie 2025-11-18  852  	ddebug_class_param_clamp_input(&inrep, kp);
b9400852c0801a Jim Cromie 2022-09-04  853  
b9400852c0801a Jim Cromie 2022-09-04 @854  	switch (map->map_type) {
                                                        ^^^^^
Because if so we are in trouble.

b9400852c0801a Jim Cromie 2022-09-04  855  	case DD_CLASS_TYPE_DISJOINT_BITS:
7f10c4fc568572 Jim Cromie 2025-11-18  856  		old_val = READ_ONCE(*dcp->bits);
62b32b2a95ef1c Jim Cromie 2025-11-18  857  		v2pr_info("bits:0x%x > %s.%s\n", inrep, mod_name ?: "*", KP_NAME(kp));
a62837264de615 Jim Cromie 2025-11-18  858  		totct += ddebug_apply_class_bitmap(dcp, &inrep, old_val, mod_name);
7f10c4fc568572 Jim Cromie 2025-11-18  859  		WRITE_ONCE(*dcp->bits, inrep);

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

