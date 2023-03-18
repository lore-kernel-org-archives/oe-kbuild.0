Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F5AB2917;
	Sat, 18 Mar 2023 14:13:05 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id p4so6694474wre.11;
        Sat, 18 Mar 2023 07:13:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679148783;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DieDvloehk2ELZvk5Km8dotRjtej3CMAm156VBnhhAs=;
        b=fyLfUyEgS48RZWcn4JQ8nzUPSZr+O8ZPQv3heF//gxuKjS4Nz0yJKYUH76GuosDdNx
         5vs3sVo0zOZVkZwmngbiCFSlWLjQsophtr+T+eJsZl9OlcZ4kXFx8WAILgkmsvveUV6y
         h25wNTf3IYd11JVgxHf4dZCZIz4pa6Xj5wGodDUyZae8Fbdtlt2jZh9FOpmxDADRmjYs
         CtBczAD11OmLeFocjflGtKwdQdwlDPeSTnefljcOqmWU2RWSwMRga7DGKb+7ROkGyEDb
         7N+so9fub7zKpFyNVvIDqCy4q7/jQsONSM83LUR1LqbjKENdQEmtPjglJ1w4dsJsh8UI
         Dirg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679148783;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DieDvloehk2ELZvk5Km8dotRjtej3CMAm156VBnhhAs=;
        b=SJQrlrsAkPyFWCZ+OciYLJ4iS5kdWKSwmprTaELzIC3xH2/3k5cFUlNo9tPYZ5rqNG
         QEWANs8I4QcNWVFFr1ufYjkxi1tW9M9E0KYwdD38DXTexBdy+CnuI+d2QPyGI+Krxz7J
         MneEV44dho7kBlvThxt9LlIcr5P9ihStgGTptRhd2/DhZvcIBTttCOwKJ6JHvKKPt5UX
         QRuBcLBJZBLU99yCNe9Qtv3ON9q09moKjw+4Ul1CLkNgG7exqJ9iZVBx7y7xJVjCI1C1
         zmGRmNyRK19B7YmqKBeyp3DZ3aNTLfX2mBWOmxMMj9qG7S4pGX+/LdNvXxutviuARQ0J
         vxGQ==
X-Gm-Message-State: AO0yUKULJvce2dL44Q6vtn3GpbYewtOhlmGZpxetf+mrHEn3JRYtB+Ip
	tIdIORMgnNBtg191TdxbzSaCFeq9KY8=
X-Google-Smtp-Source: AK7set9p80FNm8T4nJ99mycbGazIFjXcEFzaOxxJpxXa3uxDe1r9+aT5VMUzlKlHQHy7j8KC5YWKZQ==
X-Received: by 2002:a5d:4802:0:b0:2d3:f610:8417 with SMTP id l2-20020a5d4802000000b002d3f6108417mr3383242wrq.0.1679148782951;
        Sat, 18 Mar 2023 07:13:02 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id a4-20020adffb84000000b002d322b9a7f5sm4415988wrr.88.2023.03.18.07.13.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Mar 2023 07:13:02 -0700 (PDT)
Date: Sat, 18 Mar 2023 17:12:58 +0300
From: Dan Carpenter <error27@gmail.com>
To: oe-kbuild@lists.linux.dev, Luis Chamberlain <mcgrof@kernel.org>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [mcgrof:20230317-module-alloc-opts 27/31] kernel/module/main.c:2280
 move_module() error: uninitialized symbol 't'.
Message-ID: <e597c167-62fa-4040-a1b4-63d842332a2b@kili.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mcgrof/linux.git 20230317-module-alloc-opts
head:   68dfd11f7ebeb379312f4fc89c2792ce52d71ab4
commit: 139e5ac36c4aa1e28a51bf98a7304d3040c6da6b [27/31] module: add stop-grap sanity check on module memcpy()
config: i386-randconfig-m021 (https://download.01.org/0day-ci/archive/20230318/202303182034.J3BFg2Yd-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202303182034.J3BFg2Yd-lkp@intel.com/

smatch warnings:
kernel/module/main.c:2280 move_module() error: uninitialized symbol 't'.

vim +/t +2280 kernel/module/main.c

49668688dd5a5f kernel/module.c      Rusty Russell    2010-08-05  2212  static int move_module(struct module *mod, struct load_info *info)
65b8a9b4d55253 kernel/module.c      Linus Torvalds   2010-08-05  2213  {
65b8a9b4d55253 kernel/module.c      Linus Torvalds   2010-08-05  2214  	int i;
65b8a9b4d55253 kernel/module.c      Linus Torvalds   2010-08-05  2215  	void *ptr;
ac3b4328392344 kernel/module/main.c Song Liu         2023-02-06  2216  	enum mod_mem_type t;
139e5ac36c4aa1 kernel/module/main.c Luis Chamberlain 2023-03-17  2217  	int ret = -ENOMEM;
65b8a9b4d55253 kernel/module.c      Linus Torvalds   2010-08-05  2218  
ac3b4328392344 kernel/module/main.c Song Liu         2023-02-06  2219  	for_each_mod_mem_type(type) {
ac3b4328392344 kernel/module/main.c Song Liu         2023-02-06  2220  		if (!mod->mem[type].size) {
ac3b4328392344 kernel/module/main.c Song Liu         2023-02-06  2221  			mod->mem[type].base = NULL;
ac3b4328392344 kernel/module/main.c Song Liu         2023-02-06  2222  			continue;
65b8a9b4d55253 kernel/module.c      Linus Torvalds   2010-08-05  2223  		}
ac3b4328392344 kernel/module/main.c Song Liu         2023-02-06  2224  		mod->mem[type].size = PAGE_ALIGN(mod->mem[type].size);
ac3b4328392344 kernel/module/main.c Song Liu         2023-02-06  2225  		ptr = module_memory_alloc(mod->mem[type].size, type);
65b8a9b4d55253 kernel/module.c      Linus Torvalds   2010-08-05  2226  
01dc0386efb769 kernel/module/main.c Christophe Leroy 2022-02-23  2227  		/*
01dc0386efb769 kernel/module/main.c Christophe Leroy 2022-02-23  2228  		 * The pointer to this block is stored in the module structure
01dc0386efb769 kernel/module/main.c Christophe Leroy 2022-02-23  2229  		 * which is inside the block. Just mark it as not being a
01dc0386efb769 kernel/module/main.c Christophe Leroy 2022-02-23  2230  		 * leak.
01dc0386efb769 kernel/module/main.c Christophe Leroy 2022-02-23  2231  		 */
ac3b4328392344 kernel/module/main.c Song Liu         2023-02-06  2232  		kmemleak_ignore(ptr);
01dc0386efb769 kernel/module/main.c Christophe Leroy 2022-02-23  2233  		if (!ptr) {
ac3b4328392344 kernel/module/main.c Song Liu         2023-02-06  2234  			t = type;
ac3b4328392344 kernel/module/main.c Song Liu         2023-02-06  2235  			goto out_enomem;
ac3b4328392344 kernel/module/main.c Song Liu         2023-02-06  2236  		}
ac3b4328392344 kernel/module/main.c Song Liu         2023-02-06  2237  		memset(ptr, 0, mod->mem[type].size);
ac3b4328392344 kernel/module/main.c Song Liu         2023-02-06  2238  		mod->mem[type].base = ptr;
01dc0386efb769 kernel/module/main.c Christophe Leroy 2022-02-23  2239  	}
01dc0386efb769 kernel/module/main.c Christophe Leroy 2022-02-23  2240  
65b8a9b4d55253 kernel/module.c      Linus Torvalds   2010-08-05  2241  	/* Transfer each section which specifies SHF_ALLOC */
5e12416927975a kernel/module.c      Jim Cromie       2011-12-06  2242  	pr_debug("final section addresses:\n");
49668688dd5a5f kernel/module.c      Rusty Russell    2010-08-05  2243  	for (i = 0; i < info->hdr->e_shnum; i++) {
65b8a9b4d55253 kernel/module.c      Linus Torvalds   2010-08-05  2244  		void *dest;
49668688dd5a5f kernel/module.c      Rusty Russell    2010-08-05  2245  		Elf_Shdr *shdr = &info->sechdrs[i];
ac3b4328392344 kernel/module/main.c Song Liu         2023-02-06  2246  		enum mod_mem_type type = shdr->sh_entsize >> SH_ENTSIZE_TYPE_SHIFT;
65b8a9b4d55253 kernel/module.c      Linus Torvalds   2010-08-05  2247  
49668688dd5a5f kernel/module.c      Rusty Russell    2010-08-05  2248  		if (!(shdr->sh_flags & SHF_ALLOC))
65b8a9b4d55253 kernel/module.c      Linus Torvalds   2010-08-05  2249  			continue;
65b8a9b4d55253 kernel/module.c      Linus Torvalds   2010-08-05  2250  
ac3b4328392344 kernel/module/main.c Song Liu         2023-02-06  2251  		dest = mod->mem[type].base + (shdr->sh_entsize & SH_ENTSIZE_OFFSET_MASK);
65b8a9b4d55253 kernel/module.c      Linus Torvalds   2010-08-05  2252  
139e5ac36c4aa1 kernel/module/main.c Luis Chamberlain 2023-03-17  2253  		if (shdr->sh_type != SHT_NOBITS) {
139e5ac36c4aa1 kernel/module/main.c Luis Chamberlain 2023-03-17  2254  			/*
139e5ac36c4aa1 kernel/module/main.c Luis Chamberlain 2023-03-17  2255  			 * Our ELF checker already validated this, but let's
139e5ac36c4aa1 kernel/module/main.c Luis Chamberlain 2023-03-17  2256  			 * be pedantic and make the goal clearer. We actually
139e5ac36c4aa1 kernel/module/main.c Luis Chamberlain 2023-03-17  2257  			 * end up copying over all modifications made to the
139e5ac36c4aa1 kernel/module/main.c Luis Chamberlain 2023-03-17  2258  			 * userspace copy of the entire struct module.
139e5ac36c4aa1 kernel/module/main.c Luis Chamberlain 2023-03-17  2259  			 */
139e5ac36c4aa1 kernel/module/main.c Luis Chamberlain 2023-03-17  2260  			if (i == info->index.mod &&
139e5ac36c4aa1 kernel/module/main.c Luis Chamberlain 2023-03-17  2261  			   (WARN_ON_ONCE(shdr->sh_size != sizeof(struct module)))) {
139e5ac36c4aa1 kernel/module/main.c Luis Chamberlain 2023-03-17  2262  				ret = -ENOEXEC;
139e5ac36c4aa1 kernel/module/main.c Luis Chamberlain 2023-03-17  2263  				goto out_enomem;

t is uninitialized here.

139e5ac36c4aa1 kernel/module/main.c Luis Chamberlain 2023-03-17  2264  			}
49668688dd5a5f kernel/module.c      Rusty Russell    2010-08-05  2265  			memcpy(dest, (void *)shdr->sh_addr, shdr->sh_size);
139e5ac36c4aa1 kernel/module/main.c Luis Chamberlain 2023-03-17  2266  		}
139e5ac36c4aa1 kernel/module/main.c Luis Chamberlain 2023-03-17  2267  		/*
139e5ac36c4aa1 kernel/module/main.c Luis Chamberlain 2023-03-17  2268  		 * Update the userspace copy's ELF section address to point to
139e5ac36c4aa1 kernel/module/main.c Luis Chamberlain 2023-03-17  2269  		 * our newly allocated memory as a pure convenience so that
139e5ac36c4aa1 kernel/module/main.c Luis Chamberlain 2023-03-17  2270  		 * users of info can keep taking advantage and using the newly
139e5ac36c4aa1 kernel/module/main.c Luis Chamberlain 2023-03-17  2271  		 * minted official memory area.
139e5ac36c4aa1 kernel/module/main.c Luis Chamberlain 2023-03-17  2272  		 */
49668688dd5a5f kernel/module.c      Rusty Russell    2010-08-05  2273  		shdr->sh_addr = (unsigned long)dest;
5e12416927975a kernel/module.c      Jim Cromie       2011-12-06  2274  		pr_debug("\t0x%lx %s\n",
5e12416927975a kernel/module.c      Jim Cromie       2011-12-06  2275  			 (long)shdr->sh_addr, info->secstrings + shdr->sh_name);
65b8a9b4d55253 kernel/module.c      Linus Torvalds   2010-08-05  2276  	}
d913188c751911 kernel/module.c      Rusty Russell    2010-08-05  2277  
d913188c751911 kernel/module.c      Rusty Russell    2010-08-05  2278  	return 0;
ac3b4328392344 kernel/module/main.c Song Liu         2023-02-06  2279  out_enomem:
ac3b4328392344 kernel/module/main.c Song Liu         2023-02-06 @2280  	for (t--; t >= 0; t--)
ac3b4328392344 kernel/module/main.c Song Liu         2023-02-06  2281  		module_memory_free(mod->mem[t].base, t);
ac3b4328392344 kernel/module/main.c Song Liu         2023-02-06  2282  	return -ENOMEM;
65b8a9b4d55253 kernel/module.c      Linus Torvalds   2010-08-05  2283  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

