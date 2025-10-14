Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72A9E30F940
	for <oe-kbuild@lists.linux.dev>; Tue, 14 Oct 2025 08:28:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760430494; cv=none; b=r2VIrCfi64mNhr8/CkrqBfclycn6+aoXr8XtLSC9A3kL71wrEf1rzAK/wI0twl72GeqLFs2vaN8mcmrI254oQedkpt7UdZ3/1VBFQUOwK8hJv3r5UwzfyNPktfszqxv4h/JLmDYRLEeTzVXZ/juvgiZiMZf7wtDlOnvUXUHiANg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760430494; c=relaxed/simple;
	bh=BW5sik9NW+CFCrbI7Awm1BkjwwTYStfVQ/oaNrDmKnY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=h2+2fr+lRa+yisdT0Pw/fupo4ZnqG8KQqUVruaT38EOdTbh83rRebf9uAtrh2bq4bb5l0ihbz4IliV3KiwVr97Imglgah3W1M0RZxw1z0/G5Qnsnz+qIG6n5PX9I+3GmkDDuBn+UTOeIj8sl1pO+iQ8Z40fv7H6zjbsgQHhCWkY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rUoCChgn; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rUoCChgn"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-46e42deffa8so47537235e9.0
        for <oe-kbuild@lists.linux.dev>; Tue, 14 Oct 2025 01:28:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760430490; x=1761035290; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZMmcKKtzsAFzuEGIDGC8F2Daew0h91iJpeeav+ugrHo=;
        b=rUoCChgn/uDrGShqkaMtVr4FqoGIs5Y2zjehbGTdGmZdEPG9taqUB/YVSHVYs9HYCr
         N3wQLlb7WTKGVEwb5zHcnpEKVMGA0dOqTBGvIzj7LcsF16GxoOMENgVNY7csPB7oDEjQ
         Q9ZhWkswptiyKw+NA34aTJeBeEhgutGnvcH9s9v5uRI2YF3yCwXo9AZN3zj1PoGp5zwh
         IuHdkDeD/MqyZJyi5M8vVEJxuDow0DjiAjfiQZIQ2ZVYBVDX+KyoZVkk7+/V/U0vmgQE
         VhowKkB9KlmKkKxNSDmcmIt2JJB/26NXQ/+YboFyLe+PD2Lwv+b8GhQvRNlYGTRnR+IZ
         TPHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760430490; x=1761035290;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZMmcKKtzsAFzuEGIDGC8F2Daew0h91iJpeeav+ugrHo=;
        b=wCegrnb2janUJcfP9BHgYsZOJ+AqgaqK6pEC0obUVpfxK6rrTqVDukwyHyJpwCTfSx
         wORMvoiuKYCD8YjF4YDKQg1+Pu9Rse5NRTVMHqHvb3rLEGImxQsIsUWFtSM74IwoLF84
         JBbJu1JOWT107+v+TgE4ZJNF+W/5ydqWWqyMQjrbw/l66eOo4au/rhxQRH9pQa2XV1Cq
         LKF9qu/dXl0ObOpFdwnYZPPM7SRTgMwWO2gzH5Wrt8gemidCJmt7JSHRzpP57Piaeg5v
         5nNZGrs5pfCmhUMov/MymX63uFR6GoUJoekJPKuDk0puFrk9uFyd/SABlpnt9CTNR3Qq
         j+6Q==
X-Gm-Message-State: AOJu0Yz/+mxlqYPVq6dtFhuP0zI1r7h/Syv0B2VK+GhdDDbCKA8q5HgG
	/Bgauw/L9Hkn7Lqpns33fJlLec2dvqzRIf7PS5qvWe1HAlLJVUoayopLKWRUPlHUrD9AMt+QltG
	/u7Gz
X-Gm-Gg: ASbGncuC07PRM9lt07kDeR6d7sqha8UVb6ABeDoR8Vw/WjR+tOLeRPdBBqCRPmKBSg2
	Rhuv7PbptySByTj7HpK/Sky7N3Shz8XCIgjHCQnQZiFHQM/ppw5UFPnCbKSLr4pm5cnFFgn6OV1
	UwfObDIn53cSLnM7Be5KoXzOd0oYFsa/HJC5a9QNfzsRlWgDm9t2JBuQLRGTm3oCQGAnSIk1hIG
	m3pgzB8ovosXila3b3JKasOdIzMjhPRFnE4KEqiPY61PkSl0WmEIc/MqPDhEIgRP0m2VJwgr5y7
	hjuLxAxSpTdPsPtrzYzs9284yyjbUn8gC+O/JPFIGmWSFPFHjqoifuGu3QwJjczWeSG8YnijEZL
	VEyvStqDexGxxj8EhZbM2aR5cEfCTkS1Y+KHbyRbl2jQPXo4Y77w=
X-Google-Smtp-Source: AGHT+IHg93aeG/+rqWGvVOf5SViU9wzXfImlvuVSqw4Zl6WnSo614BhemIrHZLx8kViaZ8pW3TgLTg==
X-Received: by 2002:a05:600c:19d0:b0:46e:761b:e7ff with SMTP id 5b1f17b1804b1-46fa9b06c8cmr173278365e9.28.1760430490392;
        Tue, 14 Oct 2025 01:28:10 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-46fb489ad27sm227170535e9.15.2025.10.14.01.28.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Oct 2025 01:28:09 -0700 (PDT)
Date: Tue, 14 Oct 2025 11:28:06 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Yadong Qi <yadong.qi@linux.alibaba.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>,
	Huang Ying <ying.huang@linux.alibaba.com>
Subject: [akpm-mm:mm-new 114/114] mm/vmalloc.c:191 vmap_pmd_range() error:
 uninitialized symbol 'err'.
Message-ID: <202510110050.VG9YKMRK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Message-ID: <20251014082806.nNwP2tzAG9TtCi1b9u_soyzW45c12yi0bm3SS0Gb4DE@z>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-new
head:   dbf0247637dd0601a462793035bdd0b416b30e36
commit: dbf0247637dd0601a462793035bdd0b416b30e36 [114/114] mm: vmalloc: WARN_ON if mapping size is not PAGE_SIZE aligned
config: sparc-randconfig-r071-20251010 (https://download.01.org/0day-ci/archive/20251011/202510110050.VG9YKMRK-lkp@intel.com/config)
compiler: sparc-linux-gcc (GCC) 8.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202510110050.VG9YKMRK-lkp@intel.com/

smatch warnings:
mm/vmalloc.c:191 vmap_pmd_range() error: uninitialized symbol 'err'.
mm/vmalloc.c:243 vmap_pud_range() error: uninitialized symbol 'err'.
mm/vmalloc.c:295 vmap_p4d_range() error: uninitialized symbol 'err'.

vim +/err +191 mm/vmalloc.c

5e9e3d777b99aa Nicholas Piggin 2021-04-29  167  static int vmap_pmd_range(pud_t *pud, unsigned long addr, unsigned long end,
5e9e3d777b99aa Nicholas Piggin 2021-04-29  168  			phys_addr_t phys_addr, pgprot_t prot,
5e9e3d777b99aa Nicholas Piggin 2021-04-29  169  			unsigned int max_page_shift, pgtbl_mod_mask *mask)
5e9e3d777b99aa Nicholas Piggin 2021-04-29  170  {
5e9e3d777b99aa Nicholas Piggin 2021-04-29  171  	pmd_t *pmd;
5e9e3d777b99aa Nicholas Piggin 2021-04-29  172  	unsigned long next;
dbf0247637dd06 Yadong Qi       2025-10-10  173  	int err;
5e9e3d777b99aa Nicholas Piggin 2021-04-29  174  
5e9e3d777b99aa Nicholas Piggin 2021-04-29  175  	pmd = pmd_alloc_track(&init_mm, pud, addr, mask);
5e9e3d777b99aa Nicholas Piggin 2021-04-29  176  	if (!pmd)
5e9e3d777b99aa Nicholas Piggin 2021-04-29  177  		return -ENOMEM;
5e9e3d777b99aa Nicholas Piggin 2021-04-29  178  	do {
5e9e3d777b99aa Nicholas Piggin 2021-04-29  179  		next = pmd_addr_end(addr, end);
5e9e3d777b99aa Nicholas Piggin 2021-04-29  180  
5e9e3d777b99aa Nicholas Piggin 2021-04-29  181  		if (vmap_try_huge_pmd(pmd, addr, next, phys_addr, prot,
5e9e3d777b99aa Nicholas Piggin 2021-04-29  182  					max_page_shift)) {
5e9e3d777b99aa Nicholas Piggin 2021-04-29  183  			*mask |= PGTBL_PMD_MODIFIED;
5e9e3d777b99aa Nicholas Piggin 2021-04-29  184  			continue;

Is it possible to hit the continue on every iteration through the loop?

5e9e3d777b99aa Nicholas Piggin 2021-04-29  185  		}
5e9e3d777b99aa Nicholas Piggin 2021-04-29  186  
dbf0247637dd06 Yadong Qi       2025-10-10  187  		err = vmap_pte_range(pmd, addr, next, phys_addr, prot, max_page_shift, mask);
dbf0247637dd06 Yadong Qi       2025-10-10  188  		if (err)
dbf0247637dd06 Yadong Qi       2025-10-10  189  			break;

I always feel like these are better as a "return ret;" anyway.  Then it's
just one line to read instead of needing to "break; ... return err;".
Twice as fast to read one line vs two lines.

5e9e3d777b99aa Nicholas Piggin 2021-04-29  190  	} while (pmd++, phys_addr += (next - addr), addr = next, addr != end);
dbf0247637dd06 Yadong Qi       2025-10-10 @191  	return err;
5e9e3d777b99aa Nicholas Piggin 2021-04-29  192  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

