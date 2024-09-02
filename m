Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0822176035
	for <oe-kbuild@lists.linux.dev>; Mon,  2 Sep 2024 09:14:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725268459; cv=none; b=XG2j+YFpM2UkGfV5L0n5w0YXCGRw4Hn45sbKa5ObRPVLDmimpbw/srETC2OEU4W5ldLjsXFgalGzjLjq7lkSlsheFQtBrrr6oAZVNH0pDj3W8+63PskTH3jNzEB7DLCa2/gEeRYEZVwEOWqirrMdWXrsGOMxKp9vCBc4jJ5s6mU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725268459; c=relaxed/simple;
	bh=Qv8rNg2ir2Rw0qmnjhutxtlIiFPoLVSGa2Y4UUQsF0k=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=fPVQEyhWv/nRbnQjKYhtmOIf7HRuNa77T1bZ5BmZXlsEkAvxLRYbDRyGn/8UZlcjaZoY92zowUX1p9yxAYQLinHO+uP7+uDd/lTHhg0VRHO3Dtak0Aj6cL8XWkZN63pTnLiaqczv1kTKDmRgdCPCn7dU8D9rB3dTHmpFsxzCMNo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4AE4FFEC;
	Mon,  2 Sep 2024 02:14:43 -0700 (PDT)
Received: from e116581.blr.arm.com (e116581.arm.com [10.162.42.24])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 0C3B83F73F;
	Mon,  2 Sep 2024 02:14:14 -0700 (PDT)
From: Dev Jain <dev.jain@arm.com>
To: lkp@intel.com
Cc: error27@gmail.com,
	oe-kbuild@lists.linux.dev,
	Dev Jain <dev.jain@arm.com>
Subject: Re: [PATCH 1/2] mm: Abstract THP allocation
Date: Mon,  2 Sep 2024 14:44:04 +0530
Message-Id: <20240902091404.127275-1-dev.jain@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <202409011215.bhqLigEB-lkp@intel.com>
References: <202409011215.bhqLigEB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Please check with the following patch. In do_huge_zero_wp_pmd_locked(),
unlocking should not happen, that function should execute only in
locked state. So pull out the unlocking out of map_pmd_thp().

Signed-off-by: Dev Jain <dev.jain@arm.com>
---
 mm/huge_memory.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/mm/huge_memory.c b/mm/huge_memory.c
index e5b568e2bb34..58125fbcc532 100644
--- a/mm/huge_memory.c
+++ b/mm/huge_memory.c
@@ -987,7 +987,6 @@ static void __thp_fault_success_stats(struct vm_area_struct *vma, int order)
 static void map_pmd_thp(struct folio *folio, struct vm_fault *vmf,
 			struct vm_area_struct *vma, unsigned long haddr,
 			pgtable_t pgtable)
-	__releases(vmf->ptl)
 {
 	pmd_t entry;
 
@@ -1000,8 +999,6 @@ static void map_pmd_thp(struct folio *folio, struct vm_fault *vmf,
 	update_mmu_cache_pmd(vma, vmf->address, vmf->pmd);
 	add_mm_counter(vma->vm_mm, MM_ANONPAGES, HPAGE_PMD_NR);
 	mm_inc_nr_ptes(vma->vm_mm);
-	spin_unlock(vmf->ptl);
-	__thp_fault_success_stats(vma, HPAGE_PMD_ORDER);
 }
 
 static vm_fault_t __do_huge_pmd_anonymous_page(struct vm_fault *vmf)
@@ -1043,6 +1040,8 @@ static vm_fault_t __do_huge_pmd_anonymous_page(struct vm_fault *vmf)
 			return ret;
 		}
 		map_pmd_thp(folio, vmf, vma, haddr, pgtable);
+		spin_unlock(vmf->ptl);
+		__thp_fault_success_stats(vma, HPAGE_PMD_ORDER);
 	}
 
 	return 0;
-- 
2.30.2

