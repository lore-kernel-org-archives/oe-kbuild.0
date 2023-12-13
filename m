Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7BD168277
	for <oe-kbuild@lists.linux.dev>; Wed, 13 Dec 2023 19:27:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="oRi/9+2O"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-1d3470496e2so15887405ad.1
        for <oe-kbuild@lists.linux.dev>; Wed, 13 Dec 2023 11:27:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1702495625; x=1703100425; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=KIEPLdJEFA0Pp7hDQ0afFUbi4IxWG/oxBggCByZxVD8=;
        b=oRi/9+2OZi9JvLPStmQEMYGjeAb3lgA2NAx+irIsoxpit/jPRSoX5G4PLpNXebHYK6
         D+XzquUZdCQRn3BWmAceya0dHwTCmn7ffA6LxOAGkScTWFXfxy6ShCZOCCh2OMd8oUbr
         y/6wTQtj9JbNjhCSbU5g5LStda3/ntlCoH+3xI18xa5CtIO0lFHxpyhqyXT3OqVKCwMO
         zFQZNNJD2ed4GxJCTB3R+q08tAGkXMffcRejjOD5h6O1ayh04J3dT0Esiehk+L4QhKKa
         Qa3efSocDUqTq6kcklKdcw+2MlhqUL4v2BD/PBFHZddrgxMu2b8Qyx5FsIdm//RMg2nO
         hI3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702495625; x=1703100425;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KIEPLdJEFA0Pp7hDQ0afFUbi4IxWG/oxBggCByZxVD8=;
        b=t4vqKMyMZ7JR4Dpa388DvwJrhHRRv1EPqCfzcLRs6sixADYCW9B3If2YtxDocDDAXr
         cW+CAEV+gQug+m4IYVd2NK9mkv+eACancwfPehwR5q0mgTsrNxS+wYFFBFxaxxUUfroe
         NWV7q6zF/3ktTr8Nc7AnX6nH0Q7DVtBcQQ7V+NfAlOaRlGL/gMyOChqNQhQfioyJWENp
         j2YMzSwRIwV/b2qctrthkuZNyNkyeDdSXQCxV3GSCj5UUzzgNiTTXWbQW2CoCDw6KuHE
         ujfNXAnQTKe0vJ2bxMq6YZTfFyhDckH8q/DLmsAmzNkhx167LqOHTXYlhzX3MGxeuQUW
         MzKw==
X-Gm-Message-State: AOJu0YyZHIyw72qCxFB4oILfHIEOK9Mfc2KMVThe8Cm4SmlZEsRmWhaE
	R2Hd+ctBkKxGwaDb08A0OzpNjGju5F4w1z+Pwu0=
X-Google-Smtp-Source: AGHT+IFVnijvC7DmbF9oVgw3j5vO5QO1E4REyMR8ceh13qQPVQip3PXwpzTIFfwoe6uikxQ2apUM/Q==
X-Received: by 2002:a17:902:db0c:b0:1d0:b503:1ea5 with SMTP id m12-20020a170902db0c00b001d0b5031ea5mr10267620plx.20.1702495625028;
        Wed, 13 Dec 2023 11:27:05 -0800 (PST)
Received: from ghost ([12.44.203.122])
        by smtp.gmail.com with ESMTPSA id ba1-20020a170902720100b001d09c539c95sm10962745plb.90.2023.12.13.11.27.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Dec 2023 11:27:04 -0800 (PST)
Date: Wed, 13 Dec 2023 11:27:02 -0800
From: Charlie Jenkins <charlie@rivosinc.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: oe-kbuild@lists.linux.dev, lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@rivosinc.com>
Subject: Re: arch/riscv/kernel/module.c:639 process_accumulated_relocations()
 error: uninitialized symbol 'curr_type'.
Message-ID: <ZXoFhu2TPXgrsInY@ghost>
References: <d0897fb3-1af8-430b-aa8b-9aa829bad1d7@suswa.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d0897fb3-1af8-430b-aa8b-9aa829bad1d7@suswa.mountain>

On Wed, Dec 13, 2023 at 04:05:06PM +0300, Dan Carpenter wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> head:   cf52eed70e555e864120cfaf280e979e2a035c66
> commit: 8fd6c5142395a106b63c8668e9f4a7106b6a0772 riscv: Add remaining module relocations
> config: riscv-randconfig-r071-20231211 (https://download.01.org/0day-ci/archive/20231213/202312130859.wnkuzVWY-lkp@intel.com/config)
> compiler: riscv64-linux-gcc (GCC) 13.2.0
> reproduce: (https://download.01.org/0day-ci/archive/20231213/202312130859.wnkuzVWY-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> | Closes: https://lore.kernel.org/r/202312130859.wnkuzVWY-lkp@intel.com/
> 
> New smatch warnings:
> arch/riscv/kernel/module.c:639 process_accumulated_relocations() error: uninitialized symbol 'curr_type'.
> 
> Old smatch warnings:
> arch/riscv/kernel/module.c:632 process_accumulated_relocations() error: dereferencing freed memory 'rel_entry_iter'
> arch/riscv/kernel/module.c:629 process_accumulated_relocations() error: dereferencing freed memory 'rel_head_iter'
> arch/riscv/kernel/module.c:628 process_accumulated_relocations() error: dereferencing freed memory 'bucket_iter'
> 
> vim +/curr_type +639 arch/riscv/kernel/module.c
> 
> 8fd6c5142395a1 Charlie Jenkins 2023-11-01  602  void process_accumulated_relocations(struct module *me)
> 8fd6c5142395a1 Charlie Jenkins 2023-11-01  603  {
> 8fd6c5142395a1 Charlie Jenkins 2023-11-01  604  	/*
> 8fd6c5142395a1 Charlie Jenkins 2023-11-01  605  	 * Only ADD/SUB/SET/ULEB128 should end up here.
> 8fd6c5142395a1 Charlie Jenkins 2023-11-01  606  	 *
> 8fd6c5142395a1 Charlie Jenkins 2023-11-01  607  	 * Each bucket may have more than one relocation location. All
> 8fd6c5142395a1 Charlie Jenkins 2023-11-01  608  	 * relocations for a location are stored in a list in a bucket.
> 8fd6c5142395a1 Charlie Jenkins 2023-11-01  609  	 *
> 8fd6c5142395a1 Charlie Jenkins 2023-11-01  610  	 * Relocations are applied to a temp variable before being stored to the
> 8fd6c5142395a1 Charlie Jenkins 2023-11-01  611  	 * provided location to check for overflow. This also allows ULEB128 to
> 8fd6c5142395a1 Charlie Jenkins 2023-11-01  612  	 * properly decide how many entries are needed before storing to
> 8fd6c5142395a1 Charlie Jenkins 2023-11-01  613  	 * location. The final value is stored into location using the handler
> 8fd6c5142395a1 Charlie Jenkins 2023-11-01  614  	 * for the last relocation to an address.
> 8fd6c5142395a1 Charlie Jenkins 2023-11-01  615  	 *
> 8fd6c5142395a1 Charlie Jenkins 2023-11-01  616  	 * Three layers of indexing:
> 8fd6c5142395a1 Charlie Jenkins 2023-11-01  617  	 *	- Each of the buckets in use
> 8fd6c5142395a1 Charlie Jenkins 2023-11-01  618  	 *	- Groups of relocations in each bucket by location address
> 8fd6c5142395a1 Charlie Jenkins 2023-11-01  619  	 *	- Each relocation entry for a location address
> 8fd6c5142395a1 Charlie Jenkins 2023-11-01  620  	 */
> 8fd6c5142395a1 Charlie Jenkins 2023-11-01  621  	struct used_bucket *bucket_iter;
> 8fd6c5142395a1 Charlie Jenkins 2023-11-01  622  	struct relocation_head *rel_head_iter;
> 8fd6c5142395a1 Charlie Jenkins 2023-11-01  623  	struct relocation_entry *rel_entry_iter;
> 8fd6c5142395a1 Charlie Jenkins 2023-11-01  624  	int curr_type;
> 8fd6c5142395a1 Charlie Jenkins 2023-11-01  625  	void *location;
> 8fd6c5142395a1 Charlie Jenkins 2023-11-01  626  	long buffer;
> 8fd6c5142395a1 Charlie Jenkins 2023-11-01  627  
> 8fd6c5142395a1 Charlie Jenkins 2023-11-01  628  	list_for_each_entry(bucket_iter, &used_buckets_list, head) {
> 8fd6c5142395a1 Charlie Jenkins 2023-11-01  629  		hlist_for_each_entry(rel_head_iter, bucket_iter->bucket, node) {
> 8fd6c5142395a1 Charlie Jenkins 2023-11-01  630  			buffer = 0;
> 8fd6c5142395a1 Charlie Jenkins 2023-11-01  631  			location = rel_head_iter->location;
> 8fd6c5142395a1 Charlie Jenkins 2023-11-01  632  			list_for_each_entry(rel_entry_iter,
> 8fd6c5142395a1 Charlie Jenkins 2023-11-01  633  					    rel_head_iter->rel_entry, head) {
> 8fd6c5142395a1 Charlie Jenkins 2023-11-01  634  				curr_type = rel_entry_iter->type;
> 8fd6c5142395a1 Charlie Jenkins 2023-11-01  635  				reloc_handlers[curr_type].reloc_handler(
> 8fd6c5142395a1 Charlie Jenkins 2023-11-01  636  					me, &buffer, rel_entry_iter->value);
> 8fd6c5142395a1 Charlie Jenkins 2023-11-01  637  				kfree(rel_entry_iter);
> 
> This kfree() will lead to a NULL dereference on the next iteration
> through the loop.  You need to use list_for_each_entry_safe().
> 

This has been fixed in 6.7-rc5.

> 8fd6c5142395a1 Charlie Jenkins 2023-11-01  638  			}
> 8fd6c5142395a1 Charlie Jenkins 2023-11-01 @639  			reloc_handlers[curr_type].accumulate_handler(
>                                                                                        ^^^^^^^^^
> Can the list be empty?  Uninitialized in that case.

That's a tricky one, the list cannot be empty. Each bucket in the
bucket_iter is guarunteed to have at least one rel_entry. I can probably
resolve this by extracting this for loop into a do-while loop.

- Charlie

> 
> 8fd6c5142395a1 Charlie Jenkins 2023-11-01  640  				me, location, buffer);
> 8fd6c5142395a1 Charlie Jenkins 2023-11-01  641  			kfree(rel_head_iter);
> 8fd6c5142395a1 Charlie Jenkins 2023-11-01  642  		}
> 8fd6c5142395a1 Charlie Jenkins 2023-11-01  643  		kfree(bucket_iter);
> 8fd6c5142395a1 Charlie Jenkins 2023-11-01  644  	}
> 8fd6c5142395a1 Charlie Jenkins 2023-11-01  645  
> 8fd6c5142395a1 Charlie Jenkins 2023-11-01  646  	kfree(relocation_hashtable);
> 8fd6c5142395a1 Charlie Jenkins 2023-11-01  647  }
> 
> -- 
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
> 
