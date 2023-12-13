Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C5652C848
	for <oe-kbuild@lists.linux.dev>; Wed, 13 Dec 2023 13:05:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CPyJ6nH6"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-40c41b43e1eso43526505e9.1
        for <oe-kbuild@lists.linux.dev>; Wed, 13 Dec 2023 05:05:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702472710; x=1703077510; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ljMp018ROe4hGaH9/TJ5tyaqo+dyXzOK453gIhBKF1o=;
        b=CPyJ6nH6O0Vubi80faqW/IIq0yGZ4R80x+SbrYfk1hrnOgJ+oGOEpVRAkyYFOkK/m7
         sLWD2dOJtBZAPsriWeyDILzyZAkFMrGWLzuJQzyj5r+O55q1kBtr0IdUPLHCgHTJzvoR
         GtCuyX+bXnDVifLDxWuc+2vuo2pdH1KJjsPf/UdNYu1c5V/fbWUeiWD87WpzquUhV5jD
         uP76e6WnPgq3qHtVELzGjbuvifY43RaLy4rmbTO/I6TU61oGc+q3W74ZPppNlN8mbRl3
         wJL9yuCqTWhIdWp1+Xn45qVdD4a8kq0BTTo/vjdIyYQzIVTQOx0sgjIy7DaKj68dLLwc
         B0XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702472710; x=1703077510;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ljMp018ROe4hGaH9/TJ5tyaqo+dyXzOK453gIhBKF1o=;
        b=Ij2pEuZJGr2WeDaWN79LHREWJia7QW5ItkEEwD0o9hGQBn60/iUbDHLp50vH4P0YIa
         u25IUAME+lPwSlRWkDKx/RouA1Tuhntn2ebF4/G4nDw7Lh4e++ZRjoYA6DpQUmyNbske
         O7we2ZYvhP7E3n0VXHvFzdMZE1h+6baVnOiCX3zOyer9XxSEXqiTEj6Wy3SYIIL/0cjr
         RF04t98DZij/PqjoasrlDKl7VgpAFs1jKiq83vb2D4pe474lX4h+3nh51DORItVcKp90
         CPRXPZpLLVXekHP6R++QiKLcdN2pvpRyFAnTss7rFposCIQIk82LcoXMc7W33T+Wjcwp
         tXUg==
X-Gm-Message-State: AOJu0YyuewVtI4MI7I4WgmD7exxiXloM+FlXX2ERVNds1u/ZmZavZqxv
	jjhFPXi74qcUd9LF2hWVk3QnyRb32iNWVXBbznE=
X-Google-Smtp-Source: AGHT+IFP0pARtXM8ipvYc+9dwbUf4Ofpcumx1/QBxsaaix8XlcRLn+0bMIqoh6xLCXgl5ufWvVY31A==
X-Received: by 2002:a7b:c40d:0:b0:40c:3150:3d73 with SMTP id k13-20020a7bc40d000000b0040c31503d73mr3704075wmi.247.1702472710386;
        Wed, 13 Dec 2023 05:05:10 -0800 (PST)
Received: from localhost ([102.140.209.237])
        by smtp.gmail.com with ESMTPSA id bi11-20020a05600c3d8b00b0040c2963e5f3sm20224087wmb.38.2023.12.13.05.05.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Dec 2023 05:05:09 -0800 (PST)
Date: Wed, 13 Dec 2023 16:05:06 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Charlie Jenkins <charlie@rivosinc.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@rivosinc.com>
Subject: arch/riscv/kernel/module.c:639 process_accumulated_relocations()
 error: uninitialized symbol 'curr_type'.
Message-ID: <d0897fb3-1af8-430b-aa8b-9aa829bad1d7@suswa.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   cf52eed70e555e864120cfaf280e979e2a035c66
commit: 8fd6c5142395a106b63c8668e9f4a7106b6a0772 riscv: Add remaining module relocations
config: riscv-randconfig-r071-20231211 (https://download.01.org/0day-ci/archive/20231213/202312130859.wnkuzVWY-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231213/202312130859.wnkuzVWY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202312130859.wnkuzVWY-lkp@intel.com/

New smatch warnings:
arch/riscv/kernel/module.c:639 process_accumulated_relocations() error: uninitialized symbol 'curr_type'.

Old smatch warnings:
arch/riscv/kernel/module.c:632 process_accumulated_relocations() error: dereferencing freed memory 'rel_entry_iter'
arch/riscv/kernel/module.c:629 process_accumulated_relocations() error: dereferencing freed memory 'rel_head_iter'
arch/riscv/kernel/module.c:628 process_accumulated_relocations() error: dereferencing freed memory 'bucket_iter'

vim +/curr_type +639 arch/riscv/kernel/module.c

8fd6c5142395a1 Charlie Jenkins 2023-11-01  602  void process_accumulated_relocations(struct module *me)
8fd6c5142395a1 Charlie Jenkins 2023-11-01  603  {
8fd6c5142395a1 Charlie Jenkins 2023-11-01  604  	/*
8fd6c5142395a1 Charlie Jenkins 2023-11-01  605  	 * Only ADD/SUB/SET/ULEB128 should end up here.
8fd6c5142395a1 Charlie Jenkins 2023-11-01  606  	 *
8fd6c5142395a1 Charlie Jenkins 2023-11-01  607  	 * Each bucket may have more than one relocation location. All
8fd6c5142395a1 Charlie Jenkins 2023-11-01  608  	 * relocations for a location are stored in a list in a bucket.
8fd6c5142395a1 Charlie Jenkins 2023-11-01  609  	 *
8fd6c5142395a1 Charlie Jenkins 2023-11-01  610  	 * Relocations are applied to a temp variable before being stored to the
8fd6c5142395a1 Charlie Jenkins 2023-11-01  611  	 * provided location to check for overflow. This also allows ULEB128 to
8fd6c5142395a1 Charlie Jenkins 2023-11-01  612  	 * properly decide how many entries are needed before storing to
8fd6c5142395a1 Charlie Jenkins 2023-11-01  613  	 * location. The final value is stored into location using the handler
8fd6c5142395a1 Charlie Jenkins 2023-11-01  614  	 * for the last relocation to an address.
8fd6c5142395a1 Charlie Jenkins 2023-11-01  615  	 *
8fd6c5142395a1 Charlie Jenkins 2023-11-01  616  	 * Three layers of indexing:
8fd6c5142395a1 Charlie Jenkins 2023-11-01  617  	 *	- Each of the buckets in use
8fd6c5142395a1 Charlie Jenkins 2023-11-01  618  	 *	- Groups of relocations in each bucket by location address
8fd6c5142395a1 Charlie Jenkins 2023-11-01  619  	 *	- Each relocation entry for a location address
8fd6c5142395a1 Charlie Jenkins 2023-11-01  620  	 */
8fd6c5142395a1 Charlie Jenkins 2023-11-01  621  	struct used_bucket *bucket_iter;
8fd6c5142395a1 Charlie Jenkins 2023-11-01  622  	struct relocation_head *rel_head_iter;
8fd6c5142395a1 Charlie Jenkins 2023-11-01  623  	struct relocation_entry *rel_entry_iter;
8fd6c5142395a1 Charlie Jenkins 2023-11-01  624  	int curr_type;
8fd6c5142395a1 Charlie Jenkins 2023-11-01  625  	void *location;
8fd6c5142395a1 Charlie Jenkins 2023-11-01  626  	long buffer;
8fd6c5142395a1 Charlie Jenkins 2023-11-01  627  
8fd6c5142395a1 Charlie Jenkins 2023-11-01  628  	list_for_each_entry(bucket_iter, &used_buckets_list, head) {
8fd6c5142395a1 Charlie Jenkins 2023-11-01  629  		hlist_for_each_entry(rel_head_iter, bucket_iter->bucket, node) {
8fd6c5142395a1 Charlie Jenkins 2023-11-01  630  			buffer = 0;
8fd6c5142395a1 Charlie Jenkins 2023-11-01  631  			location = rel_head_iter->location;
8fd6c5142395a1 Charlie Jenkins 2023-11-01  632  			list_for_each_entry(rel_entry_iter,
8fd6c5142395a1 Charlie Jenkins 2023-11-01  633  					    rel_head_iter->rel_entry, head) {
8fd6c5142395a1 Charlie Jenkins 2023-11-01  634  				curr_type = rel_entry_iter->type;
8fd6c5142395a1 Charlie Jenkins 2023-11-01  635  				reloc_handlers[curr_type].reloc_handler(
8fd6c5142395a1 Charlie Jenkins 2023-11-01  636  					me, &buffer, rel_entry_iter->value);
8fd6c5142395a1 Charlie Jenkins 2023-11-01  637  				kfree(rel_entry_iter);

This kfree() will lead to a NULL dereference on the next iteration
through the loop.  You need to use list_for_each_entry_safe().

8fd6c5142395a1 Charlie Jenkins 2023-11-01  638  			}
8fd6c5142395a1 Charlie Jenkins 2023-11-01 @639  			reloc_handlers[curr_type].accumulate_handler(
                                                                                       ^^^^^^^^^
Can the list be empty?  Uninitialized in that case.

8fd6c5142395a1 Charlie Jenkins 2023-11-01  640  				me, location, buffer);
8fd6c5142395a1 Charlie Jenkins 2023-11-01  641  			kfree(rel_head_iter);
8fd6c5142395a1 Charlie Jenkins 2023-11-01  642  		}
8fd6c5142395a1 Charlie Jenkins 2023-11-01  643  		kfree(bucket_iter);
8fd6c5142395a1 Charlie Jenkins 2023-11-01  644  	}
8fd6c5142395a1 Charlie Jenkins 2023-11-01  645  
8fd6c5142395a1 Charlie Jenkins 2023-11-01  646  	kfree(relocation_hashtable);
8fd6c5142395a1 Charlie Jenkins 2023-11-01  647  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

