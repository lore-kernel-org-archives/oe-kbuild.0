Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com [209.85.221.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDE1B1FF1B5
	for <oe-kbuild@lists.linux.dev>; Sun, 18 Jan 2026 11:58:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=209.85.221.67
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768737534; cv=fail; b=dXCRU0zDpYntglfDfmGG9V/tFDg5cioYq/HreOHLFaPDkKOegw3yRjaWigRmh4ueolTXFC+39bJI839eHTHg+zmtE9fZrHJIgiLHWH+8KqfoajHDJHtPNnqmar/Z1UyQwckqMDjOpnULyNlO0y7dWDK1lYxrOcI4+u6YrbjlcO8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768737534; c=relaxed/simple;
	bh=g8b+7FN6hbMN4O9Hn0Wuu/BLjD5D8KBegkn2jyUcxwg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=p4JTE+QiX8sYCyMxQZAHbujqFCTbbYyJ3AHjfPSjiC16hBDBIMXfjCPKLcCDkme5tW2o5NNki8U42x7IRC2LQW2VvYtPWQ9o59H/ulHoWuqMhLvbhafQ78voYfLk3UcGI7l3jmlAzsCanM8i3Y71ykYxJuZudr3FBF77qx1I988=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=fail (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ig3pyCzU reason="signature verification failed"; arc=fail smtp.client-ip=209.85.221.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ig3pyCzU"
Received: by mail-wr1-f67.google.com with SMTP id ffacd0b85a97d-432d2c7a8b9so2991603f8f.2
        for <oe-kbuild@lists.linux.dev>; Sun, 18 Jan 2026 03:58:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768737530; x=1769342330;
        h=user-agent:dkim-signature:content-disposition:mime-version
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=R7CnKYyGATdcnfJVFfqty0HDn4MM5rcaDGkaO2vD5H4=;
        b=kgSyfm6WJ2Yd/CqmijZ/COm+2ru0k8jY9Ebe2Yn0aWxGCnwYjNKhmS+BDtPtiByL7M
         2LH3iU4HXYm8Szwlk0OqsuJz0W+Qr0GxEfTIzeJ27+uweYvprO8AI+Q9Rs/5H7ZbhHAq
         /HJpmDhnsoNRFa9oMbBzSJ6DIX1GVp8h1EYNqvTirsFA+FWla4zfDtKHvWlAgCfhup1J
         phYcbxoUI0OgE1M1zD1m3Hug31cIjuUUDCN5pl58BzZBtHpOjWpDy0sSk46LinrV5a03
         cSG+AwS4FlZKhzV1WWvN1hZqXZzqERBxx4KPLFbFNxcr51GPH2HtTGpiaoSB1FJpcEB7
         CfmQ==
X-Gm-Message-State: AOJu0Yzz+xksORuNysaHh1VDEbRsTZ9GzwUcER0a1c6NqzUAOKw5hJDI
	cwJNzflZxykTgyumvQ1p0OACqXEQF7HIvLEuSJgA+lN50pWQTIXuU0RHeELytN1lAuv59sAilzy
	gAnM8+Hk=
X-Gm-Gg: AY/fxX4yCktI/jJ3gYnz/IvdTLGtWBHRauI9fR6WoZK1vytdIgMzWWTtkTB0+F1LPFT
	hkk2zvewzt7nAfRT070rs2XDz+kxtpm1mm14shOY777qKzp0vDjbv51kYQWoeioTZKY6VEmZYIp
	YRCcmVPgz6HCMmnuO8PBnlCWdnDj3/fAzpLzyS9wdwIHCpJOJ3wAfuUV8nuPnIsv5AllFxN0qud
	/S2u0sknz9YP9u0ZCZoLhJVjgMnI+rC95RpqS5HE/OsapDaxv7CqC3pQkPr74cU9MF6PynNS7PX
	HS3MdOUZn2VTSzpp19PsZm5GVutg20XydC78Xnk/fGjgO35LDyolZRJAGCJ70bRUopxzt2WskH7
	xGaTER2iMOKkszV6pZICFRgbxUc5kv13L1GO5/0psAnYzEKWJrvgBkpeyFzyYH68j9Vjdw7KvZ1
	VGIZALKhmzOes/nH4m
X-Received: by 2002:a05:6000:1448:b0:430:f5ed:83e3 with SMTP id ffacd0b85a97d-4356a03318amr10305126f8f.6.1768737529917;
        Sun, 18 Jan 2026 03:58:49 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4356997e6cdsm17608884f8f.31.2026.01.18.03.58.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Jan 2026 03:58:49 -0800 (PST)
Date: Sun, 18 Jan 2026 14:58:46 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [akpm-mm:mm-new 331/335] mm/memcontrol-v1.c:685 memcg1_swapout()
 warn: inconsistent returns 'rcu_read'.
Message-ID: <202601151810.ie4EgP4S-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received: from imap.gmail.com (142.251.173.108:993) by stanley.mountain with
 IMAP4-SSL getmail6 msgid:674269650/327162; 18 Jan 2026 04:38:27 -0000
Received: by 2002:adf:f650:0:b0:432:7de3:b366 with SMTP id x16csp625143wrp;
 Thu, 15 Jan 2026 02:24:00 -0800 (PST)
X-Forwarded-Encrypted: i=2;
 AJvYcCVEe7ndboKV51W9nzsFLFEoh1X4SguybXXTp1KsPJWTbK3/PWdq7JkyabuBuWN53EoBG4RJtBqK@gmail.com
X-Received: by 2002:a05:7300:d709:b0:2b0:5609:a593 with SMTP id
 5a478bee46e88-2b486cad5b5mr6998946eec.16.1768472640017;        Thu, 15 Jan
 2026 02:24:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768472640; cv=none;        d=google.com;
 s=arc-20240605;
 b=KciGAFD4CAWHCoMa7MnfYxlNL2YWxWZrgySmqGKCunwJCH6Rkoyt0Sr0qDeaJDkNOI
 1rL7DOK9SwY1vQFCzr80UhTfRB+1NERW6HHMgJ+nBEYM53hQN1kQ0D58ZsucU4H5WE2w
 VpIb9UHP9yQ1hFb5QfSOjJd6CDi3MfxipYOwuvLPWYChEB1tP3klD4kdQejcuoBl/z32
 WL0lLEfXWqCUW3o4McdZ3o/TGIRo9h28tgHFXo2eV161a5TomWqNACwUE+M7qlJ0dcVL
 lHKkE6N+iZChG/ORYFq224tmd825V2bpDotvfdPOwsin5AHl8PyNklSFDKVnw6MaYn2/ CIeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605;
 h=user-agent:message-id:subject:cc:to:from:date:dkim-signature;
 bh=4QCADRPSbiFAp0aTZLqrbR52IGEn+gmiW2Gn5hU6Iyc=;
 fh=STwU/6nAwSVI2oUzRWkoH/BhmoKW+LI2Ifd8kl7IM00=;
 b=kXYsYWTSR1b8POo8KkQn2D6Aim/F7GD+s2o2df6cEk2nGmX7Sn2RQUkjwJp9D74SNn
 Nx9XOrvyeIUzTloRfYAiwAjl2E1vrtIvsQNfdE5aBMdhMRamNerb9Eb6hT3i64lYlO4s
 PcZObYRUe4ymy0tsm6OEXMeSOuNXKTV3ySWPy3FsOkHMFi2WumUV23BfLmO0GdaUwTVD
 5nRwRYIfuZFc1xwuCjG65he4VbT5T2DcY6+bb8VTGMa4lNpEdowa6hbWC/xeYrbNc79X
 941WTaONFXSf0LWQA7e9lvxTB2YfkEGLTUgrfz2ZBCuqG+tiQYgT97Z1wBh17rPlXto9 3cUw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;       dkim=pass
 header.i=@intel.com header.s=Intel header.b=Ig3pyCzU;       spf=pass
 (google.com: domain of lkp@intel.com designates 192.198.163.19 as permitted
 sender) smtp.mailfrom=lkp@intel.com;       dmarc=pass (p=NONE sp=NONE
 dis=NONE) header.from=intel.com
Received: from mgamail.intel.com (mgamail.intel.com. [192.198.163.19]) by
 mx.google.com with ESMTPS id
 5a478bee46e88-2b1706b4b69si75765137eec.34.2026.01.15.02.23.59        for
 <dan.carpenter@linaro.org>        (version=TLS1_2
 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);        Thu, 15 Jan 2026
 02:23:59 -0800 (PST)
Received-SPF: pass (google.com: domain of lkp@intel.com designates
 192.198.163.19 as permitted sender) client-ip=192.198.163.19;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;  d=intel.com;
 i=@intel.com; q=dns/txt; s=Intel;  t=1768472640; x=1800008640;
 h=date:from:to:cc:subject:message-id;
 bh=8G5r9TQAMFyCvWQzw0chL1VjTls4ntaO7GCWnRtV4Ok=;
 b=Ig3pyCzUDVF0j52VAS+aEDrC+D8VM+kw06zSKBbYA5hRrrEQWiDRXA+U
 ficoqdnvvg95QyipHUzRl4IPJWKSk37KBs810Z+JXY2DWpLFBBbqE4RWG
 g0HIeQzZmZqLMIhJzTBQod4VAWrSNTIvqoiHNVfzUObt/DZKSZPpC6Ym9
 qeXdd/bFBSoyH+oC892q5WjVs1+0H2mTnm8OhlLrdvqPmnmqlDB7iFdaT
 hWw4gL1ypAz/poDHz6/ru5pqWkjMltVDsPFvTMr90VK+y4I43u9pQN1wA
 b8UJRKBl40bhvsJ1pGXvPMkswKmtWQOMsRPmbY7FYtvu1em61iiAriV5a   g==;
X-CSE-ConnectionGUID: VRe2+nfmQXO6ZmOIfP2p5w==
X-CSE-MsgGUID: aORDrY1YQm6yHt9OewUHow==
Received: from fmviesa005.fm.intel.com ([10.60.135.145])  by
 fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jan
 2026 02:23:59 -0800
X-CSE-ConnectionGUID: dMz9cv9GRwOWKSHhur45gw==
X-CSE-MsgGUID: Qbu4pdMvRSuBv6vAjuwbVw==
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f)
 ([10.239.97.150])  by fmviesa005.fm.intel.com with ESMTP; 15 Jan 2026
 02:23:57 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2) (envelope-from
 <lkp@intel.com>) id 1vgKWB-00000000HqI-0yBL; Thu, 15 Jan 2026 10:23:55 +0000
User-Agent: s-nail v14.9.25
Message-ID: <20260118115846.6yO_Jsw8FHoEMd2IO8B7kR2sLWDRWNozNCqZ0B6XnqY@z>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: David Hildenbrand <david@kernel.org>
TO: Muchun Song <songmuchun@bytedance.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>
CC: Qi Zheng <zhengqi.arch@bytedance.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-new
head:   78d5565acc4516dfe1fe5a3779a53bc7aaedc2e1
commit: 8e5f42f2bf326f0efb1e565fa57b5ef99b40e646 [331/335] mm: memcontrol: eliminate the problem of dying memory cgroup for LRU folios
config: parisc-randconfig-r072-20260115 (https://download.01.org/0day-ci/archive/20260115/202601151810.ie4EgP4S-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 13.4.0
smatch version: v0.5.0-8985-g2614ff1a

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202601151810.ie4EgP4S-lkp@intel.com/

smatch warnings:
mm/memcontrol-v1.c:685 memcg1_swapout() warn: inconsistent returns 'rcu_read'.

vim +/rcu_read +685 mm/memcontrol-v1.c

f7d49ba03ae755 Shakeel Butt       2024-08-14  605  
89ce924f0bd447 Johannes Weiner    2025-01-24  606  /**
89ce924f0bd447 Johannes Weiner    2025-01-24  607   * memcg1_swapout - transfer a memsw charge to swap
89ce924f0bd447 Johannes Weiner    2025-01-24  608   * @folio: folio whose memsw charge to transfer
89ce924f0bd447 Johannes Weiner    2025-01-24  609   * @entry: swap entry to move the charge to
89ce924f0bd447 Johannes Weiner    2025-01-24  610   *
89ce924f0bd447 Johannes Weiner    2025-01-24  611   * Transfer the memsw charge of @folio to @entry.
89ce924f0bd447 Johannes Weiner    2025-01-24  612   */
89ce924f0bd447 Johannes Weiner    2025-01-24  613  void memcg1_swapout(struct folio *folio, swp_entry_t entry)
f7d49ba03ae755 Shakeel Butt       2024-08-14  614  {
89ce924f0bd447 Johannes Weiner    2025-01-24  615  	struct mem_cgroup *memcg, *swap_memcg;
8e5f42f2bf326f Muchun Song        2026-01-14  616  	struct obj_cgroup *objcg;
89ce924f0bd447 Johannes Weiner    2025-01-24  617  	unsigned int nr_entries;
8cb494d6e92a26 Deepanshu Kartikey 2026-01-10  618  	unsigned short oldid;
89ce924f0bd447 Johannes Weiner    2025-01-24  619  
89ce924f0bd447 Johannes Weiner    2025-01-24  620  	VM_BUG_ON_FOLIO(folio_test_lru(folio), folio);
89ce924f0bd447 Johannes Weiner    2025-01-24  621  	VM_BUG_ON_FOLIO(folio_ref_count(folio), folio);
89ce924f0bd447 Johannes Weiner    2025-01-24  622  
89ce924f0bd447 Johannes Weiner    2025-01-24  623  	if (mem_cgroup_disabled())
89ce924f0bd447 Johannes Weiner    2025-01-24  624  		return;
89ce924f0bd447 Johannes Weiner    2025-01-24  625  
89ce924f0bd447 Johannes Weiner    2025-01-24  626  	if (!do_memsw_account())
89ce924f0bd447 Johannes Weiner    2025-01-24  627  		return;
89ce924f0bd447 Johannes Weiner    2025-01-24  628  
8e5f42f2bf326f Muchun Song        2026-01-14  629  	objcg = folio_objcg(folio);
8e5f42f2bf326f Muchun Song        2026-01-14  630  	VM_WARN_ON_ONCE_FOLIO(!objcg, folio);
8e5f42f2bf326f Muchun Song        2026-01-14  631  	if (!objcg)
89ce924f0bd447 Johannes Weiner    2025-01-24  632  		return;
89ce924f0bd447 Johannes Weiner    2025-01-24  633  
8e5f42f2bf326f Muchun Song        2026-01-14  634  	rcu_read_lock();
8e5f42f2bf326f Muchun Song        2026-01-14  635  	memcg = obj_cgroup_memcg(objcg);
8cb494d6e92a26 Deepanshu Kartikey 2026-01-10  636  	/*
8cb494d6e92a26 Deepanshu Kartikey 2026-01-10  637  	 * Check if this swap entry is already recorded. This can happen
8cb494d6e92a26 Deepanshu Kartikey 2026-01-10  638  	 * when MADV_PAGEOUT is called multiple times on pages that remain
8cb494d6e92a26 Deepanshu Kartikey 2026-01-10  639  	 * in swapcache, reusing the same swap entries.
8cb494d6e92a26 Deepanshu Kartikey 2026-01-10  640  	 */
8cb494d6e92a26 Deepanshu Kartikey 2026-01-10  641  	oldid = lookup_swap_cgroup_id(entry);
8cb494d6e92a26 Deepanshu Kartikey 2026-01-10  642  	if (oldid == mem_cgroup_id(memcg))
8cb494d6e92a26 Deepanshu Kartikey 2026-01-10  643  		return;
8cb494d6e92a26 Deepanshu Kartikey 2026-01-10  644  	VM_WARN_ON_ONCE(oldid != 0);
8cb494d6e92a26 Deepanshu Kartikey 2026-01-10  645  
89ce924f0bd447 Johannes Weiner    2025-01-24  646  	/*
89ce924f0bd447 Johannes Weiner    2025-01-24  647  	 * In case the memcg owning these pages has been offlined and doesn't
89ce924f0bd447 Johannes Weiner    2025-01-24  648  	 * have an ID allocated to it anymore, charge the closest online
89ce924f0bd447 Johannes Weiner    2025-01-24  649  	 * ancestor for the swap instead and transfer the memory+swap charge.
89ce924f0bd447 Johannes Weiner    2025-01-24  650  	 */
1d7634095c770c Shakeel Butt       2025-12-25  651  	swap_memcg = mem_cgroup_private_id_get_online(memcg);
89ce924f0bd447 Johannes Weiner    2025-01-24  652  	nr_entries = folio_nr_pages(folio);
89ce924f0bd447 Johannes Weiner    2025-01-24  653  	/* Get references for the tail pages, too */
89ce924f0bd447 Johannes Weiner    2025-01-24  654  	if (nr_entries > 1)
1d7634095c770c Shakeel Butt       2025-12-25  655  		mem_cgroup_private_id_get_many(swap_memcg, nr_entries - 1);
89ce924f0bd447 Johannes Weiner    2025-01-24  656  	mod_memcg_state(swap_memcg, MEMCG_SWAP, nr_entries);
89ce924f0bd447 Johannes Weiner    2025-01-24  657  
1d7634095c770c Shakeel Butt       2025-12-25  658  	swap_cgroup_record(folio, mem_cgroup_private_id(swap_memcg), entry);
89ce924f0bd447 Johannes Weiner    2025-01-24  659  
89ce924f0bd447 Johannes Weiner    2025-01-24  660  	folio_unqueue_deferred_split(folio);
89ce924f0bd447 Johannes Weiner    2025-01-24  661  	folio->memcg_data = 0;
89ce924f0bd447 Johannes Weiner    2025-01-24  662  
8e5f42f2bf326f Muchun Song        2026-01-14  663  	if (!obj_cgroup_is_root(objcg))
89ce924f0bd447 Johannes Weiner    2025-01-24  664  		page_counter_uncharge(&memcg->memory, nr_entries);
89ce924f0bd447 Johannes Weiner    2025-01-24  665  
89ce924f0bd447 Johannes Weiner    2025-01-24  666  	if (memcg != swap_memcg) {
89ce924f0bd447 Johannes Weiner    2025-01-24  667  		if (!mem_cgroup_is_root(swap_memcg))
89ce924f0bd447 Johannes Weiner    2025-01-24  668  			page_counter_charge(&swap_memcg->memsw, nr_entries);
89ce924f0bd447 Johannes Weiner    2025-01-24  669  		page_counter_uncharge(&memcg->memsw, nr_entries);
89ce924f0bd447 Johannes Weiner    2025-01-24  670  	}
89ce924f0bd447 Johannes Weiner    2025-01-24  671  
f7d49ba03ae755 Shakeel Butt       2024-08-14  672  	/*
f7d49ba03ae755 Shakeel Butt       2024-08-14  673  	 * Interrupts should be disabled here because the caller holds the
f7d49ba03ae755 Shakeel Butt       2024-08-14  674  	 * i_pages lock which is taken with interrupts-off. It is
f7d49ba03ae755 Shakeel Butt       2024-08-14  675  	 * important here to have the interrupts disabled because it is the
f7d49ba03ae755 Shakeel Butt       2024-08-14  676  	 * only synchronisation we have for updating the per-CPU variables.
f7d49ba03ae755 Shakeel Butt       2024-08-14  677  	 */
f7d49ba03ae755 Shakeel Butt       2024-08-14  678  	preempt_disable_nested();
f7d49ba03ae755 Shakeel Butt       2024-08-14  679  	VM_WARN_ON_IRQS_ENABLED();
f7d49ba03ae755 Shakeel Butt       2024-08-14  680  	memcg1_charge_statistics(memcg, -folio_nr_pages(folio));
f7d49ba03ae755 Shakeel Butt       2024-08-14  681  	preempt_enable_nested();
f7d49ba03ae755 Shakeel Butt       2024-08-14  682  	memcg1_check_events(memcg, folio_nid(folio));
89ce924f0bd447 Johannes Weiner    2025-01-24  683  
8e5f42f2bf326f Muchun Song        2026-01-14  684  	rcu_read_unlock();
8e5f42f2bf326f Muchun Song        2026-01-14 @685  	obj_cgroup_put(objcg);
89ce924f0bd447 Johannes Weiner    2025-01-24  686  }
89ce924f0bd447 Johannes Weiner    2025-01-24  687  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

Date: Thu, 15 Jan 2026 15:59:07 +0530
From: Khushal Chitturi <khushalchitturi@gmail.com>
To: gregkh@linuxfoundation.org
Cc: dan.carpenter@linaro.org, hansg@kernel.org, straube.linux@gmail.com,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, Khushal
 Chitturi <khushalchitturi@gmail.com>
Subject: [PATCH 1/4] staging: rtl8723bs: fix operator and type cast spacing
Message-ID: <20260115102910.10018-2-khushalchitturi@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset=utf-8

Fix spacing around operators and type casts in rtw_xmit.c to
comply with the kernel coding style.

Signed-off-by: Khushal Chitturi <khushalchitturi@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_xmit.c | 89 +++++++++++++----------
 1 file changed, 50 insertions(+), 39 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_xmit.c b/drivers/staging/rtl8723bs/core/rtw_xmit.c
index 21690857fd62..bbc42db1c828 100644
--- a/drivers/staging/rtl8723bs/core/rtw_xmit.c
+++ b/drivers/staging/rtl8723bs/core/rtw_xmit.c
@@ -78,7 +78,7 @@ s32 _rtw_init_xmit_priv(struct xmit_priv *pxmitpriv, struct adapter *padapter)
 	}
 	pxmitpriv->pxmit_frame_buf = (u8 *)N_BYTE_ALIGMENT((SIZE_PTR)(pxmitpriv->pallocated_frame_buf), 4);
 
-	pxframe = (struct xmit_frame *) pxmitpriv->pxmit_frame_buf;
+	pxframe = (struct xmit_frame *)pxmitpriv->pxmit_frame_buf;
 
 	for (i = 0; i < NR_XMITFRAME; i++) {
 		INIT_LIST_HEAD(&pxframe->list);
@@ -238,7 +238,9 @@ s32 _rtw_init_xmit_priv(struct xmit_priv *pxmitpriv, struct adapter *padapter)
 			pxmitbuf->padapter = padapter;
 			pxmitbuf->buf_tag = XMITBUF_CMD;
 
-			res = rtw_os_xmit_resource_alloc(padapter, pxmitbuf, MAX_CMDBUF_SZ+XMITBUF_ALIGN_SZ, true);
+			res = rtw_os_xmit_resource_alloc(padapter, pxmitbuf,
+							 MAX_CMDBUF_SZ + XMITBUF_ALIGN_SZ,
+							 true);
 			if (res == _FAIL) {
 				res = _FAIL;
 				goto exit;
@@ -248,7 +250,7 @@ s32 _rtw_init_xmit_priv(struct xmit_priv *pxmitpriv, struct adapter *padapter)
 			pxmitbuf->pend = pxmitbuf->pbuf + MAX_CMDBUF_SZ;
 			pxmitbuf->len = 0;
 			pxmitbuf->pdata = pxmitbuf->ptail = pxmitbuf->phead;
-			pxmitbuf->alloc_sz = MAX_CMDBUF_SZ+XMITBUF_ALIGN_SZ;
+			pxmitbuf->alloc_sz = MAX_CMDBUF_SZ + XMITBUF_ALIGN_SZ;
 		}
 	}
 
@@ -274,7 +276,7 @@ void _rtw_free_xmit_priv(struct xmit_priv *pxmitpriv)
 {
 	int i;
 	struct adapter *padapter = pxmitpriv->adapter;
-	struct xmit_frame	*pxmitframe = (struct xmit_frame *) pxmitpriv->pxmit_frame_buf;
+	struct xmit_frame	*pxmitframe = (struct xmit_frame *)pxmitpriv->pxmit_frame_buf;
 	struct xmit_buf *pxmitbuf = (struct xmit_buf *)pxmitpriv->pxmitbuf;
 
 	rtw_hal_free_xmit_priv(padapter);
@@ -321,7 +323,9 @@ void _rtw_free_xmit_priv(struct xmit_priv *pxmitpriv)
 	for (i = 0; i < CMDBUF_MAX; i++) {
 		pxmitbuf = &pxmitpriv->pcmd_xmitbuf[i];
 		if (pxmitbuf)
-			rtw_os_xmit_resource_free(padapter, pxmitbuf, MAX_CMDBUF_SZ+XMITBUF_ALIGN_SZ, true);
+			rtw_os_xmit_resource_free(padapter, pxmitbuf,
+						  MAX_CMDBUF_SZ + XMITBUF_ALIGN_SZ,
+						  true);
 	}
 
 	rtw_free_hwxmits(padapter);
@@ -736,7 +740,7 @@ static s32 update_attrib(struct adapter *padapter, struct sk_buff *pkt, struct p
 	pattrib->subtype = WIFI_DATA_TYPE;
 	pattrib->priority = 0;
 
-	if (check_fwstate(pmlmepriv, WIFI_AP_STATE|WIFI_ADHOC_STATE|WIFI_ADHOC_MASTER_STATE)) {
+	if (check_fwstate(pmlmepriv, WIFI_AP_STATE | WIFI_ADHOC_STATE | WIFI_ADHOC_MASTER_STATE)) {
 		if (pattrib->qos_en)
 			set_qos(&pktfile, pattrib);
 	} else {
@@ -787,15 +791,15 @@ static s32 xmitframe_addmic(struct adapter *padapter, struct xmit_frame *pxmitfr
 				rtw_secmicsetkey(&micdata, &pattrib->dot11tkiptxmickey.skey[0]);
 			}
 
-			if (pframe[1]&1) {   /* ToDS == 1 */
+			if (pframe[1] & 1) {   /* ToDS == 1 */
 				rtw_secmicappend(&micdata, &pframe[16], 6);  /* DA */
-				if (pframe[1]&2)  /* From Ds == 1 */
+				if (pframe[1] & 2)  /* From Ds == 1 */
 					rtw_secmicappend(&micdata, &pframe[24], 6);
 				else
 					rtw_secmicappend(&micdata, &pframe[10], 6);
 			} else {	/* ToDS == 0 */
 				rtw_secmicappend(&micdata, &pframe[4], 6);   /* DA */
-				if (pframe[1]&2)  /* From Ds == 1 */
+				if (pframe[1] & 2)  /* From Ds == 1 */
 					rtw_secmicappend(&micdata, &pframe[16], 6);
 				else
 					rtw_secmicappend(&micdata, &pframe[10], 6);
@@ -810,16 +814,20 @@ static s32 xmitframe_addmic(struct adapter *padapter, struct xmit_frame *pxmitfr
 
 			for (curfragnum = 0; curfragnum < pattrib->nr_frags; curfragnum++) {
 				payload = (u8 *)round_up((SIZE_PTR)(payload), 4);
-				payload = payload+pattrib->hdrlen+pattrib->iv_len;
+				payload = payload + pattrib->hdrlen + pattrib->iv_len;
 
-				if ((curfragnum+1) == pattrib->nr_frags) {
-					length = pattrib->last_txcmdsz-pattrib->hdrlen-pattrib->iv_len-((pattrib->bswenc) ? pattrib->icv_len : 0);
+				if ((curfragnum + 1) == pattrib->nr_frags) {
+					length = pattrib->last_txcmdsz - pattrib->hdrlen -
+						 pattrib->iv_len -
+						 ((pattrib->bswenc) ? pattrib->icv_len : 0);
 					rtw_secmicappend(&micdata, payload, length);
-					payload = payload+length;
+					payload = payload + length;
 				} else {
-					length = pxmitpriv->frag_len-pattrib->hdrlen-pattrib->iv_len-((pattrib->bswenc) ? pattrib->icv_len : 0);
+					length = pxmitpriv->frag_len - pattrib->hdrlen -
+						 pattrib->iv_len -
+						 ((pattrib->bswenc) ? pattrib->icv_len : 0);
 					rtw_secmicappend(&micdata, payload, length);
-					payload = payload+length+pattrib->icv_len;
+					payload = payload + length + pattrib->icv_len;
 				}
 			}
 			rtw_secgetmic(&micdata, &mic[0]);
@@ -1108,8 +1116,10 @@ s32 rtw_xmitframe_coalesce(struct adapter *padapter, struct sk_buff *pkt, struct
 		if (bmcst || (rtw_endofpktfile(&pktfile) == true)) {
 			pattrib->nr_frags = frg_inx;
 
-			pattrib->last_txcmdsz = pattrib->hdrlen + pattrib->iv_len + ((pattrib->nr_frags == 1) ? llc_sz:0) +
-					((pattrib->bswenc) ? pattrib->icv_len : 0) + mem_sz;
+			pattrib->last_txcmdsz = pattrib->hdrlen + pattrib->iv_len +
+						((pattrib->nr_frags == 1) ? llc_sz : 0) +
+						((pattrib->bswenc) ? pattrib->icv_len : 0) +
+						mem_sz;
 
 			ClearMFrag(mem_start);
 
@@ -1158,7 +1168,7 @@ s32 rtw_mgmt_xmitframe_coalesce(struct adapter *padapter, struct sk_buff *pkt, s
 	mem_start = pframe = (u8 *)(pxmitframe->buf_addr) + TXDESC_OFFSET;
 	pwlanhdr = (struct ieee80211_hdr *)pframe;
 
-	ori_len = BIP_AAD_SIZE+pattrib->pktlen;
+	ori_len = BIP_AAD_SIZE + pattrib->pktlen;
 	tmp_buf = BIP_AAD = rtw_zmalloc(ori_len);
 	subtype = GetFrameSubType(pframe); /* bit(7)~bit(2) */
 
@@ -1211,14 +1221,14 @@ s32 rtw_mgmt_xmitframe_coalesce(struct adapter *padapter, struct sk_buff *pkt, s
 		/* conscruct AAD, copy address 1 to address 3 */
 		memcpy(BIP_AAD + 2, &pwlanhdr->addrs, sizeof(pwlanhdr->addrs));
 		/* copy management fram body */
-		memcpy(BIP_AAD+BIP_AAD_SIZE, MGMT_body, frame_body_len);
+		memcpy(BIP_AAD + BIP_AAD_SIZE, MGMT_body, frame_body_len);
 		/* calculate mic */
 		if (omac1_aes_128(padapter->securitypriv.dot11wBIPKey[padapter->securitypriv.dot11wBIPKeyid].skey
-			, BIP_AAD, BIP_AAD_SIZE+frame_body_len, mic))
+			, BIP_AAD, BIP_AAD_SIZE + frame_body_len, mic))
 			goto xmitframe_coalesce_fail;
 
 		/* copy right BIP mic value, total is 128bits, we use the 0~63 bits */
-		memcpy(pframe-8, mic, 8);
+		memcpy(pframe - 8, mic, 8);
 	} else { /* unicast mgmt frame TX */
 		/* start to encrypt mgmt frame */
 		if (subtype == WIFI_DEAUTH || subtype == WIFI_DISASSOC ||
@@ -1267,9 +1277,10 @@ s32 rtw_mgmt_xmitframe_coalesce(struct adapter *padapter, struct sk_buff *pkt, s
 			memcpy(pframe, pattrib->iv, pattrib->iv_len);
 			pframe += pattrib->iv_len;
 			/* copy mgmt data portion after CCMP header */
-			memcpy(pframe, tmp_buf+pattrib->hdrlen, pattrib->pktlen-pattrib->hdrlen);
+			memcpy(pframe, tmp_buf + pattrib->hdrlen,
+			       pattrib->pktlen - pattrib->hdrlen);
 			/* move pframe to end of mgmt pkt */
-			pframe += pattrib->pktlen-pattrib->hdrlen;
+			pframe += pattrib->pktlen - pattrib->hdrlen;
 			/* add 8 bytes CCMP IV header to length */
 			pattrib->pktlen += pattrib->iv_len;
 			if ((pattrib->icv_len > 0) && (pattrib->bswenc)) {
@@ -1375,7 +1386,7 @@ void rtw_count_tx_stats(struct adapter *padapter, struct xmit_frame *pxmitframe,
 	struct mlme_priv *pmlmepriv = &padapter->mlmepriv;
 	u8 pkt_num = 1;
 
-	if ((pxmitframe->frame_tag&0x0f) == DATA_FRAMETAG) {
+	if ((pxmitframe->frame_tag & 0x0f) == DATA_FRAMETAG) {
 		pkt_num = pxmitframe->agg_num;
 
 		pmlmepriv->LinkDetectInfo.NumTxOkInPeriod += pkt_num;
@@ -2070,7 +2081,7 @@ signed int xmitframe_enqueue_for_sleeping_sta(struct adapter *padapter, struct x
 
 	spin_lock_bh(&psta->sleep_q.lock);
 
-	if (psta->state&WIFI_SLEEP_STATE) {
+	if (psta->state & WIFI_SLEEP_STATE) {
 		u8 wmmps_ac = 0;
 
 		if (pstapriv->sta_dz_bitmap & BIT(psta->aid)) {
@@ -2083,20 +2094,20 @@ signed int xmitframe_enqueue_for_sleeping_sta(struct adapter *padapter, struct x
 			switch (pattrib->priority) {
 			case 1:
 			case 2:
-				wmmps_ac = psta->uapsd_bk&BIT(0);
+				wmmps_ac = psta->uapsd_bk & BIT(0);
 				break;
 			case 4:
 			case 5:
-				wmmps_ac = psta->uapsd_vi&BIT(0);
+				wmmps_ac = psta->uapsd_vi & BIT(0);
 				break;
 			case 6:
 			case 7:
-				wmmps_ac = psta->uapsd_vo&BIT(0);
+				wmmps_ac = psta->uapsd_vo & BIT(0);
 				break;
 			case 0:
 			case 3:
 			default:
-				wmmps_ac = psta->uapsd_be&BIT(0);
+				wmmps_ac = psta->uapsd_be & BIT(0);
 				break;
 			}
 
@@ -2214,20 +2225,20 @@ void wakeup_sta_to_xmit(struct adapter *padapter, struct sta_info *psta)
 		switch (pxmitframe->attrib.priority) {
 		case 1:
 		case 2:
-			wmmps_ac = psta->uapsd_bk&BIT(1);
+			wmmps_ac = psta->uapsd_bk & BIT(1);
 			break;
 		case 4:
 		case 5:
-			wmmps_ac = psta->uapsd_vi&BIT(1);
+			wmmps_ac = psta->uapsd_vi & BIT(1);
 			break;
 		case 6:
 		case 7:
-			wmmps_ac = psta->uapsd_vo&BIT(1);
+			wmmps_ac = psta->uapsd_vo & BIT(1);
 			break;
 		case 0:
 		case 3:
 		default:
-			wmmps_ac = psta->uapsd_be&BIT(1);
+			wmmps_ac = psta->uapsd_be & BIT(1);
 			break;
 		}
 
@@ -2259,7 +2270,7 @@ void wakeup_sta_to_xmit(struct adapter *padapter, struct sta_info *psta)
 
 		pstapriv->tim_bitmap &= ~BIT(psta->aid);
 
-		if (psta->state&WIFI_SLEEP_STATE)
+		if (psta->state & WIFI_SLEEP_STATE)
 			psta->state ^= WIFI_SLEEP_STATE;
 
 		if (psta->state & WIFI_STA_ALIVE_CHK_STATE) {
@@ -2274,7 +2285,7 @@ void wakeup_sta_to_xmit(struct adapter *padapter, struct sta_info *psta)
 	if (!psta_bmc)
 		goto _exit;
 
-	if ((pstapriv->sta_dz_bitmap&0xfffe) == 0x0) { /* no any sta in ps mode */
+	if ((pstapriv->sta_dz_bitmap & 0xfffe) == 0x0) { /* no any sta in ps mode */
 		xmitframe_phead = get_list_head(&psta_bmc->sleep_q);
 		list_for_each_safe(xmitframe_plist, tmp, xmitframe_phead) {
 			pxmitframe = list_entry(xmitframe_plist,
@@ -2327,20 +2338,20 @@ void xmit_delivery_enabled_frames(struct adapter *padapter, struct sta_info *pst
 		switch (pxmitframe->attrib.priority) {
 		case 1:
 		case 2:
-			wmmps_ac = psta->uapsd_bk&BIT(1);
+			wmmps_ac = psta->uapsd_bk & BIT(1);
 			break;
 		case 4:
 		case 5:
-			wmmps_ac = psta->uapsd_vi&BIT(1);
+			wmmps_ac = psta->uapsd_vi & BIT(1);
 			break;
 		case 6:
 		case 7:
-			wmmps_ac = psta->uapsd_vo&BIT(1);
+			wmmps_ac = psta->uapsd_vo & BIT(1);
 			break;
 		case 0:
 		case 3:
 		default:
-			wmmps_ac = psta->uapsd_be&BIT(1);
+			wmmps_ac = psta->uapsd_be & BIT(1);
 			break;
 		}
 
-- 
2.52.0

