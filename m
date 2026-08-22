Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D33323EA84
	for <oe-kbuild@lists.linux.dev>; Sat, 22 Aug 2026 08:10:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787386233; cv=none; b=Ac3RTpD5RDDBXouMM04MnmW/AVqBcKaSUkpG+2vxZu1AoO6Ux94w9cfEi3BnCypnMW52e/U7y87LJsNAs2+8QRq1wBV+XZu8RjwS/Bi5M0YAC1UkDXaKYlA2XbrhtalOV4do1YJFfQNYGAsmb4ODRPxLCiyyD37bWvqf37vlp74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787386233; c=relaxed/simple;
	bh=GzsnqybtEeIEXRxD1/jQsF/biSfYAhhrHp4FnmH5LNg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=q4ZlD9HYaurxeM9LWPUHnxVunbVoTksOZoPVDsi70zztEo5INyowMXsdouXdrpb2VSQsr/EMqMEvcY71540m0+iaPlP+zhyUA5wWBn0QUBRpH8/ntte4vtWsMHXlunteBQZ5vtrrJxccihQGz3ItDGi+iNBza5oiu3KdwgcWPeM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fZ64EWHJ; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fZ64EWHJ"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-47ddf7b09e5so1674461f8f.1
        for <oe-kbuild@lists.linux.dev>; Sat, 22 Aug 2026 01:10:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787386230; x=1787991030; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/WLIOyN5e+42p5FHJTXJ2LgHUHUABa7KAUy5fhDC4CY=;
        b=fZ64EWHJfOYM6xa5ihl/sGkXOmShM2gLAh9honGld7itg92aD+RL9VFjrZwUP5xd8X
         thCfgYd0YKLff/8VVDqU0K0JO4ODGRz/1coPkBh6ax/Tf9PkCpW1OPx+/dLU8bJ590cQ
         Sm7PZ7IK1WjtanJAEug2/7ONf3gJ4tjLkwdUoIi38q/eznR0uiwhyyspxRzyq7S+rGHc
         k9uWGgJoLALu1ToAsGWkWlyewMtgkOtoizLVfg9JMym0AUaRi9wo/3r7190TBDapFdrr
         inVqNRvulCGGrG/ccTlNfNSJ+jROmD5US9UWKJ+ngZ/aMLCkUA3/fTb77wY0ebW+Jpgz
         nJIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787386230; x=1787991030;
        h=in-reply-to:content-disposition:content-type:mime-version
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/WLIOyN5e+42p5FHJTXJ2LgHUHUABa7KAUy5fhDC4CY=;
        b=Asy5TlOnGnOT6dH/xNQXF7QcU9ccxfjowqyNbT3m8esZDiedwWfSCQeK68l+DQXKVF
         ocosnHYuUU1jR7FWKQK7035KH1v9ohCqBQdugaANKyrpq/6rR5jrePx2w+ISKOPzDUQf
         I4nlJC0nDrSRJnCOOKDYmbIIqHGjMl5Ru2a9xQEg5dPtjeHc34EGSgusVA704OqGdBwc
         +uLWH4+6iY7vBeIIuz/BggWO+6myzECOvpIK4ca7CR/wkUiKVPvxXmvPZEdeIy6+4NVz
         ozoH2ZAvEkv3rjLCADTF9+ZtYNvw7liN4t68IGHzBw6yL2lQC6NORPWkNL4qyYl6xZT6
         Br4A==
X-Gm-Message-State: AFuF++nFmOKioKunpOY9XO7x/KJISHE3bUtw2QUcdfpEMkZhJCSRl0mx
	5x5qVeYQj7vGz0gh07qH/T1cOzOfmbJeaWp+eQ+MgdVNvX2Ah0fyBZ7aPvcXKyQqFRpwp5gA
X-Gm-Gg: AR+sD10CGgBTA7oCYCaPOcOkC3MH6r6KAu+9YJTZo1/kUZpVQrp+90hH037CBQX2XDP
	we/NqQkzFjqps+eMzlKeVZa1WABkUDg8fNS07kO/aOYJhrumtMJUJnXxUmokHomkUGDpCwwjYUJ
	KQ815nfKh1MpUhJ+rV7nPQuSlI3E4GURGD7hNDfl7pkalONX0Mylkx6xvPgczzV1YlPBTMyPi6V
	Huf+TKgpsnzBN8Xl73passIwLB5SjdJOdDWU9EiLTh3NLFiruX5Dh1bt5WfSBAPq9xFj8wONhhF
	7OD69F+35K1Z3NLYq62qIRhWUJczrNgRaD57ev7Vbxfa80Uc1h3kIunM6tQou2scq3pTWFmNW6u
	MKZn0Y94hWEb2c/KdYP+IkRphJXzmjkTFd5wEDYVQ7W+7Jm9j9qyMNxF1wL5AsBHcunHDULDoRP
	ldfcs6H/aYRk85J4ODipdjg54ZyerhAHGGurfGa5bPmyC5A9wrEftz1w5g
X-Received: by 2002:a05:6000:27c4:b0:482:c678:72d3 with SMTP id ffacd0b85a97d-482c67873d2mr5600177f8f.15.1787386229786;
        Sat, 22 Aug 2026 01:10:29 -0700 (PDT)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482c9a9f145sm1423683f8f.0.2026.08.22.01.10.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Aug 2026 01:10:29 -0700 (PDT)
Date: Sat, 22 Aug 2026 11:10:24 +0300
From: Dan Carpenter <error27@gmail.com>
To: oe-kbuild@lists.linux.dev, Hilda Wu <hildawu@realtek.com>,
	marcel@holtmann.org
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev, luiz.dentz@gmail.com,
	linux-bluetooth@vger.kernel.org, linux-kernel@vger.kernel.org,
	alex_lu@realsil.com.cn, jason_mao@realsil.com.cn,
	zoey_zhou@realsil.com.cn, max.chou@realtek.com, kidman@realtek.com
Subject: Re: [PATCH v6] Bluetooth: btrtl: Add firmware format v3 support
Message-ID: <202608221220.dvi7OT84-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260814065920.413487-1-hildawu@realtek.com>
Message-ID: <20260822081024._fBIZ_6xB6EhAnUp6hzhDfpqIVwvN0O9f6YQlylk7CQ@z>

Hi Hilda,

kernel test robot noticed the following build warnings:

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Hilda-Wu/Bluetooth-btrtl-Add-firmware-format-v3-support/20260814-145920
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bluetooth/bluetooth.git master
patch link:    https://lore.kernel.org/r/20260814065920.413487-1-hildawu%40realtek.com
patch subject: [PATCH v6] Bluetooth: btrtl: Add firmware format v3 support
config: x86_64-randconfig-161 (https://download.01.org/0day-ci/archive/20260822/202608221220.dvi7OT84-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202608221220.dvi7OT84-lkp@intel.com/

New smatch warnings:
drivers/bluetooth/btrtl.c:1106 btrtl_free() warn: variable dereferenced before check 'btrtl_dev' (see line 1098)

Old smatch warnings:
drivers/bluetooth/btrtl.c:1326 btrtl_initialize() warn: passing zero to 'ERR_PTR'

vim +/btrtl_dev +1106 drivers/bluetooth/btrtl.c

26503ad25de8c7c Martin Blumenstingl 2018-08-02  1094  void btrtl_free(struct btrtl_device_info *btrtl_dev)
26503ad25de8c7c Martin Blumenstingl 2018-08-02  1095  {
9a24ce5e29b15c4 Max Chou            2023-04-17  1096  	struct rtl_subsection *entry, *tmp;
9a24ce5e29b15c4 Max Chou            2023-04-17  1097  
268d3636dfb2225 Alice Mikityanska   2020-01-24 @1098  	kvfree(btrtl_dev->fw_data);
268d3636dfb2225 Alice Mikityanska   2020-01-24  1099  	kvfree(btrtl_dev->cfg_data);
9a24ce5e29b15c4 Max Chou            2023-04-17  1100  
9a24ce5e29b15c4 Max Chou            2023-04-17  1101  	list_for_each_entry_safe(entry, tmp, &btrtl_dev->patch_subsecs, list) {
9a24ce5e29b15c4 Max Chou            2023-04-17  1102  		list_del(&entry->list);
9a24ce5e29b15c4 Max Chou            2023-04-17  1103  		kfree(entry);
9a24ce5e29b15c4 Max Chou            2023-04-17  1104  	}
9a24ce5e29b15c4 Max Chou            2023-04-17  1105  
8e4d5e1dbe2345c Hilda Wu            2026-08-14 @1106  	if (btrtl_dev) {

No point in checking for NULL when we have already dereferenced
btrtl_dev so many times.

8e4d5e1dbe2345c Hilda Wu            2026-08-14  1107  		struct btrtl_enh_ops *ops = symbol_get(rtl_enh_ops);
8e4d5e1dbe2345c Hilda Wu            2026-08-14  1108  
8e4d5e1dbe2345c Hilda Wu            2026-08-14  1109  		if (ops) {
8e4d5e1dbe2345c Hilda Wu            2026-08-14  1110  			if (ops->free_patch_images)
8e4d5e1dbe2345c Hilda Wu            2026-08-14  1111  				ops->free_patch_images(btrtl_dev);
8e4d5e1dbe2345c Hilda Wu            2026-08-14  1112  			symbol_put(rtl_enh_ops);
8e4d5e1dbe2345c Hilda Wu            2026-08-14  1113  		}
8e4d5e1dbe2345c Hilda Wu            2026-08-14  1114  	}
8e4d5e1dbe2345c Hilda Wu            2026-08-14  1115  
26503ad25de8c7c Martin Blumenstingl 2018-08-02  1116  	kfree(btrtl_dev);
26503ad25de8c7c Martin Blumenstingl 2018-08-02  1117  }

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

