Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C30420F5;
	Fri, 24 Mar 2023 05:03:58 +0000 (UTC)
Received: by mail-ed1-f52.google.com with SMTP id x3so3226077edb.10;
        Thu, 23 Mar 2023 22:03:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679634236;
        h=content-transfer-encoding:content-disposition:mime-version
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PhhGvtX8IhBLCppXvfT6aO9yWDL577SCfp4fzdsCWRM=;
        b=YM7gYqL1YM+nYYQ+5dubOlJeX+dp1fhlj/60cqpoGA0w7iBgyAY7KWhHLB9yzZyHEA
         2FLZWaQpWv9HFrWExAvuABSxxmj5Vzcmeo7UNEdQYp23EWHCEecwWONF985PDXZS0h2W
         G07rxDqTMyIpLHuoW+0RyQtAIaSkfMb6EIjCFMLt3DHBBoPpj2srZ+PH6mkrkALGSjyS
         KQC4UrLC7oHPYQIzkdTm+BQcW/kArSrI3zeMFR/1ZWzFpyEncaILR8yu7yoJ1gm1+GVJ
         rWKUgtbO045sHOZU+4hPDplHUMgTI7llT74F5Hd3D1jAJYH4G3saS24cXfCLYNKmoRAb
         faKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679634236;
        h=content-transfer-encoding:content-disposition:mime-version
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PhhGvtX8IhBLCppXvfT6aO9yWDL577SCfp4fzdsCWRM=;
        b=JHZca/iWMfseO923bNoj5kAvTOLGLJG3MFf8qyF9WXowPpHJNe3eU19sbkLxE8cDMo
         I4fBs2zDmZvYXSMZ/gQRDgGk0ag2zIi1e44s8HjHb0hBaaMtzoBxl2mla+DM94ngze6Y
         8cHAJKHTFLC+kHbOcUjrF9WsDgQ6O8K2fNwJWJJX8tPR3TUmbZiTDFqjHsgDtP8ZwMmZ
         241DhwGsRTD9+tKMfr8ApJ0IVtzdnDDv5AUsBnWgY5BgnO7eZKvG4PHEuGzC6iH79NHx
         D/B3JAJbN/Qs9VpGSSbK6F9IefCzEw8way+RiTw8sqt7xwGZLDA3t8GzY/K8c81tw7Hg
         3IBg==
X-Gm-Message-State: AAQBX9dtAROKvFdBtyiTN1HeHQMWS5b0DWEB7DMT0J5mbUGXkD7KpBtG
	KIRkBlqZr1Ql2FsLsa96HiLtKS5E7bUeEg==
X-Google-Smtp-Source: AKy350ZDvV9GU8SSWhxWvCaWrpWeSqu1PaXJGX5VWBBSkoHnWr1czl0lhfhU8hLXd0s1KGNeC5/Apw==
X-Received: by 2002:a17:906:5a62:b0:932:5f7d:db33 with SMTP id my34-20020a1709065a6200b009325f7ddb33mr1321224ejc.34.1679634235992;
        Thu, 23 Mar 2023 22:03:55 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id zc14-20020a170906988e00b00927f6c799e6sm9713163ejb.132.2023.03.23.22.03.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Mar 2023 22:03:55 -0700 (PDT)
Date: Fri, 24 Mar 2023 08:03:52 +0300
From: Dan Carpenter <error27@gmail.com>
To: oe-kbuild@lists.linux.dev, Lorenzo Stoakes <lstoakes@gmail.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Andrew Morton <akpm@linux-foundation.org>
Subject: [linux-next:master 5496/6100] mm/mmap.c:962 vma_merge() error:
 uninitialized symbol 'next'.
Message-ID: <7c7e59d2-435e-4677-b278-c066cae80616@kili.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   7c4a254d78f89546d0e74a40617ef24c6151c8d1
commit: e887ecae997ebaaad4d9b93e6a01fd5495ec1bc3 [5496/6100] mm/mmap/vma_merge: set next to NULL if not applicable
config: i386-randconfig-m021 (https://download.01.org/0day-ci/archive/20230324/202303240246.9rvyIPWZ-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202303240246.9rvyIPWZ-lkp@intel.com/

smatch warnings:
mm/mmap.c:962 vma_merge() error: uninitialized symbol 'next'.

vim +/next +962 mm/mmap.c

9760ebffbf5507 Liam R. Howlett    2023-01-20   904  struct vm_area_struct *vma_merge(struct vma_iterator *vmi, struct mm_struct *mm,
^1da177e4c3f41 Linus Torvalds     2005-04-16   905  			struct vm_area_struct *prev, unsigned long addr,
^1da177e4c3f41 Linus Torvalds     2005-04-16   906  			unsigned long end, unsigned long vm_flags,
^1da177e4c3f41 Linus Torvalds     2005-04-16   907  			struct anon_vma *anon_vma, struct file *file,
19a809afe2fe08 Andrea Arcangeli   2015-09-04   908  			pgoff_t pgoff, struct mempolicy *policy,
9a10064f5625d5 Colin Cross        2022-01-14   909  			struct vm_userfaultfd_ctx vm_userfaultfd_ctx,
5c26f6ac9416b6 Suren Baghdasaryan 2022-03-04   910  			struct anon_vma_name *anon_name)
^1da177e4c3f41 Linus Torvalds     2005-04-16   911  {
^1da177e4c3f41 Linus Torvalds     2005-04-16   912  	pgoff_t pglen = (end - addr) >> PAGE_SHIFT;
0503ea8f5ba73e Liam R. Howlett    2023-01-20   913  	pgoff_t vma_pgoff;
721076b86904d4 Lorenzo Stoakes    2023-03-21   914  	struct vm_area_struct *curr, *next, *res = NULL;
0503ea8f5ba73e Liam R. Howlett    2023-01-20   915  	struct vm_area_struct *vma, *adjust, *remove, *remove2;
eef199440df950 Jakub Matěna       2022-06-03   916  	int err = -1;
eef199440df950 Jakub Matěna       2022-06-03   917  	bool merge_prev = false;
eef199440df950 Jakub Matěna       2022-06-03   918  	bool merge_next = false;
0503ea8f5ba73e Liam R. Howlett    2023-01-20   919  	bool vma_expanded = false;
0503ea8f5ba73e Liam R. Howlett    2023-01-20   920  	struct vma_prepare vp;
0503ea8f5ba73e Liam R. Howlett    2023-01-20   921  	unsigned long vma_end = end;
27d6788ee67b59 Vlastimil Babka    2023-03-09   922  	long adj_start = 0;
0503ea8f5ba73e Liam R. Howlett    2023-01-20   923  	unsigned long vma_start = addr;
^1da177e4c3f41 Linus Torvalds     2005-04-16   924  
0503ea8f5ba73e Liam R. Howlett    2023-01-20   925  	validate_mm(mm);
^1da177e4c3f41 Linus Torvalds     2005-04-16   926  	/*
^1da177e4c3f41 Linus Torvalds     2005-04-16   927  	 * We later require that vma->vm_flags == vm_flags,
^1da177e4c3f41 Linus Torvalds     2005-04-16   928  	 * so this tests vma->vm_flags & VM_SPECIAL, too.
^1da177e4c3f41 Linus Torvalds     2005-04-16   929  	 */
^1da177e4c3f41 Linus Torvalds     2005-04-16   930  	if (vm_flags & VM_SPECIAL)
^1da177e4c3f41 Linus Torvalds     2005-04-16   931  		return NULL;
^1da177e4c3f41 Linus Torvalds     2005-04-16   932  
e887ecae997eba Lorenzo Stoakes    2023-03-21   933  	/* Does the input range span an existing VMA? (cases 5 - 8) */
e887ecae997eba Lorenzo Stoakes    2023-03-21   934  	curr = find_vma_intersection(mm, prev ? prev->vm_end : 0, end);
^1da177e4c3f41 Linus Torvalds     2005-04-16   935  
e887ecae997eba Lorenzo Stoakes    2023-03-21   936  	if (curr && end == curr->vm_end)
e887ecae997eba Lorenzo Stoakes    2023-03-21   937  		/* Is there is a VMA immediately adjacent (cases 6 - 8)? */
e887ecae997eba Lorenzo Stoakes    2023-03-21   938  		next = vma_lookup(mm, curr->vm_end);
e887ecae997eba Lorenzo Stoakes    2023-03-21   939  	else if (!curr)
e887ecae997eba Lorenzo Stoakes    2023-03-21   940  		/* Is there a VMA next to a hole (case 1 - 3) or prev (4)? */
e887ecae997eba Lorenzo Stoakes    2023-03-21   941  		next = vma_lookup(mm, end);

next not initialized on else path.

759224a5ffcfa1 Vlastimil Babka    2023-03-09   942  
e86f15ee64d8ee Andrea Arcangeli   2016-10-07   943  	/* verify some invariant that must be enforced by the caller */
e86f15ee64d8ee Andrea Arcangeli   2016-10-07   944  	VM_WARN_ON(prev && addr <= prev->vm_start);
721076b86904d4 Lorenzo Stoakes    2023-03-21   945  	VM_WARN_ON(curr && end > curr->vm_end);
e86f15ee64d8ee Andrea Arcangeli   2016-10-07   946  	VM_WARN_ON(addr >= end);
e86f15ee64d8ee Andrea Arcangeli   2016-10-07   947  
0503ea8f5ba73e Liam R. Howlett    2023-01-20   948  	if (prev) {
0503ea8f5ba73e Liam R. Howlett    2023-01-20   949  		res = prev;
0503ea8f5ba73e Liam R. Howlett    2023-01-20   950  		vma = prev;
0503ea8f5ba73e Liam R. Howlett    2023-01-20   951  		vma_start = prev->vm_start;
0503ea8f5ba73e Liam R. Howlett    2023-01-20   952  		vma_pgoff = prev->vm_pgoff;
eef199440df950 Jakub Matěna       2022-06-03   953  		/* Can we merge the predecessor? */
0503ea8f5ba73e Liam R. Howlett    2023-01-20   954  		if (prev->vm_end == addr && mpol_equal(vma_policy(prev), policy)
0503ea8f5ba73e Liam R. Howlett    2023-01-20   955  		    && can_vma_merge_after(prev, vm_flags, anon_vma, file,
0503ea8f5ba73e Liam R. Howlett    2023-01-20   956  				   pgoff, vm_userfaultfd_ctx, anon_name)) {
eef199440df950 Jakub Matěna       2022-06-03   957  			merge_prev = true;
18b098af2890cd Liam R. Howlett    2023-01-20   958  			vma_prev(vmi);
eef199440df950 Jakub Matěna       2022-06-03   959  		}
0503ea8f5ba73e Liam R. Howlett    2023-01-20   960  	}
eef199440df950 Jakub Matěna       2022-06-03   961  	/* Can we merge the successor? */
e887ecae997eba Lorenzo Stoakes    2023-03-21  @962  	if (next && mpol_equal(policy, vma_policy(next)) &&
                                                            ^^^^

^1da177e4c3f41 Linus Torvalds     2005-04-16   963  	    can_vma_merge_before(next, vm_flags,
eef199440df950 Jakub Matěna       2022-06-03   964  				 anon_vma, file, pgoff+pglen,
eef199440df950 Jakub Matěna       2022-06-03   965  				 vm_userfaultfd_ctx, anon_name)) {
eef199440df950 Jakub Matěna       2022-06-03   966  		merge_next = true;
eef199440df950 Jakub Matěna       2022-06-03   967  	}
0503ea8f5ba73e Liam R. Howlett    2023-01-20   968  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

