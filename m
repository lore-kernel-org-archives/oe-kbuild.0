Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88F1237C10F
	for <oe-kbuild@lists.linux.dev>; Tue, 24 Feb 2026 11:30:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771932644; cv=none; b=jbZQ2wbk4bMjEAtzsrgnQeBlFa8sLcvT/hyA06zX2n3m8rUEwSk0roa/QoLsczHGAPkTs/bK0HwOkw6bt6kWEztlTZhy0ZxI9BPHKudoX5Y36a+9wGL5oUEg9hGqgVN/f6fdeMTOlELPqbQn1Dq4/vFWzAsItu5jbBVQkluuHFE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771932644; c=relaxed/simple;
	bh=WL3WypA+i1JrUm5ZX+vYWiT8/OH/4NskOhWyZXumRT4=;
	h=Date:From:To:Subject:Message-ID; b=T9PzMF0xPa3lknXTvQf/GPMQlxWKceidyhCgPDX8uQvfSbqpEvwRerNVZzQCQYN2ydwmOxI0C//C/gzxceOfM/4trMhX9XNVA7eKcLVi02GpDKxllY+8LOgsQakzg9EevUGF/Xyh69m/FGWkQfVhrMlCxnZ0FgiJbA9ecjMrVyo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TlpDHflr; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TlpDHflr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771932642; x=1803468642;
  h=date:from:to:subject:message-id;
  bh=WL3WypA+i1JrUm5ZX+vYWiT8/OH/4NskOhWyZXumRT4=;
  b=TlpDHflrHYkwhL+9HPad3/+Zk4Uw34Wopq5csZF0N7ilBXLHr7yJ3hqR
   XWzzjqtLAAQEa/z3Rq/kdAsP3B1Z4ln7gBdK/S8n2BECh3NGQ9t0ePMQY
   TjnhpcSJCDvm3S+PuK72GhPEmYasoT/m/EO5d+k5S2lW3W1Qe63AsI5Oq
   n4lRBdPTZz20O5WUH+Wn2ftFfPUUrDUsQTCXbjJTgNGjskZXDb0Rg/Dd6
   P1FSY1hX85TKGa+0yBCWaop5D5+er4OhOF3j+f2dR8Idlk156Yt57rsYe
   C762zwHzo+AUmT5dIz5TvCXmhH/0A/QLKlQLf6ZNM94Zluzh1mSBzDU1P
   w==;
X-CSE-ConnectionGUID: uv4x28V5R+6j8GhCnNlGbw==
X-CSE-MsgGUID: dN0JGCWbRW6V1ado2C8WrA==
X-IronPort-AV: E=McAfee;i="6800,10657,11710"; a="90355579"
X-IronPort-AV: E=Sophos;i="6.21,308,1763452800"; 
   d="scan'208";a="90355579"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Feb 2026 03:30:41 -0800
X-CSE-ConnectionGUID: QmNvJTQsTZKHJorZIiVpCQ==
X-CSE-MsgGUID: P3wqttOxQvWJz0ZB8zLcKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,308,1763452800"; 
   d="scan'208";a="220869089"
Received: from igk-lkp-server01.igk.intel.com (HELO e5404a91d123) ([10.211.93.152])
  by orviesa005.jf.intel.com with ESMTP; 24 Feb 2026 03:30:39 -0800
Received: from kbuild by e5404a91d123 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vuqcf-000000005C1-1q37
	for oe-kbuild@lists.linux.dev;
	Tue, 24 Feb 2026 11:30:37 +0000
Date: Tue, 24 Feb 2026 12:30:27 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [arnd-playground:randconfig-7.1-next 31/733] checkpatch:
 ERROR:SPACING: space required before the open parenthesis '('
Message-ID: <202602241200.lW9PK8KT-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "high confidence checkpatch report"
:::::: Manual check reason: "checkpatch report for netdev code"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Arnd Bergmann <arnd@arndb.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/arnd/playground.git randconfig-7.1-next
head:   76f9bd9e344ecd3faf7bdadedc7027b64a6f2d63
commit: 8f115a8869712a4d22aa5218e1765f659af5fb63 [31/733] Revert "arch: Remove Itanium (IA-64) architecture"
:::::: branch date: 87 minutes ago
:::::: commit date: 9 days ago
reproduce: (https://download.01.org/0day-ci/archive/20260224/202602241200.lW9PK8KT-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on each line
#4683: FILE: arch/ia64/hp/common/sba_iommu.c:3:
+/*
+**  IA64 System Bus Adapter (SBA) I/O MMU manager

WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on each line
#4730: FILE: arch/ia64/hp/common/sba_iommu.c:50:
+/*
+** Enabling timing search of the pdir resource map.  Output in /proc.

WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on each line
#4736: FILE: arch/ia64/hp/common/sba_iommu.c:56:
+/*
+** This option allows cards capable of 64bit DMA to bypass the IOMMU.  If

WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on each line
#4747: FILE: arch/ia64/hp/common/sba_iommu.c:67:
+/*
+** This option specifically allows/disallows bypassing scatterlists with

WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on each line
#4756: FILE: arch/ia64/hp/common/sba_iommu.c:76:
+/*
+** If a device prefetches beyond the end of a valid pdir entry, it will cause

WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on each line
#4769: FILE: arch/ia64/hp/common/sba_iommu.c:89:
+/*
+** The number of debug flags is a clue - this code is fragile.  NOTE: since

ERROR:SPACING: space required before the open parenthesis '('
#4822: FILE: arch/ia64/hp/common/sba_iommu.c:142:
+        if(!(expr)) { \

WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on each line
#4831: FILE: arch/ia64/hp/common/sba_iommu.c:151:
+/*
+** The number of pdir entries to "free" before issuing

WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on each line
#4865: FILE: arch/ia64/hp/common/sba_iommu.c:185:
+/*
+** The zx1 IOC supports 4/8/16/64KB page sizes (see TCNFG register)

WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on each line
#4937: FILE: arch/ia64/hp/common/sba_iommu.c:257:
+/*
+** DMA_CHUNK_SIZE is used by the SCSI mid-layer to break up

WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on each line
#4948: FILE: arch/ia64/hp/common/sba_iommu.c:268:
+/************************************
+** SBA register read and write support

WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on each line
#5040: FILE: arch/ia64/hp/common/sba_iommu.c:360:
+				/*
+				** BUMMER!  -- res_map != pdir --

ERROR:RETURN_PARENTHESES: return is not a function, parentheses are not required
#5044: FILE: arch/ia64/hp/common/sba_iommu.c:364:
+				return(1);

WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on each line
#5096: FILE: arch/ia64/hp/common/sba_iommu.c:416:
+/**************************************************************
+*

ERROR:SPACING: space required before the open parenthesis '('
#5193: FILE: arch/ia64/hp/common/sba_iommu.c:513:
+		for(; res_ptr < res_end ; res_ptr++) {

WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on each line
#5208: FILE: arch/ia64/hp/common/sba_iommu.c:528:
+		/*
+		** Search the resource bit map on well-aligned values.

ERROR:SPACING: space required before the open parenthesis '('
#5221: FILE: arch/ia64/hp/common/sba_iommu.c:541:
+		for(; res_ptr < res_end ; res_ptr++)

ERROR:RETURN_PARENTHESES: return is not a function, parentheses are not required
#5284: FILE: arch/ia64/hp/common/sba_iommu.c:604:
+	return (pide);

ERROR:RETURN_PARENTHESES: return is not a function, parentheses are not required
#5289: FILE: arch/ia64/hp/common/sba_iommu.c:609:
+	return (pide);

WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on each line
#5317: FILE: arch/ia64/hp/common/sba_iommu.c:637:
+	/*
+	** "seek and ye shall find"...praying never hurts either...

WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on each line
#5327: FILE: arch/ia64/hp/common/sba_iommu.c:647:
+			/*
+			** With delayed resource freeing, we can give this one more shot.  We're

ERROR:SPACING: space required before the open parenthesis '('
#5377: FILE: arch/ia64/hp/common/sba_iommu.c:697:
+	if(0x00 != ((u8 *) ioc->pdir_base)[pide*PDIR_ENTRY_SIZE + 7]) {

ERROR:RETURN_PARENTHESES: return is not a function, parentheses are not required
#5387: FILE: arch/ia64/hp/common/sba_iommu.c:707:
+	return (pide);

WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on each line
#5439: FILE: arch/ia64/hp/common/sba_iommu.c:759:
+/**************************************************************
+*

WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on each line
#5551: FILE: arch/ia64/hp/common/sba_iommu.c:871:
+		/*
+		** clear I/O PDIR entry "valid" bit

WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on each line
#5559: FILE: arch/ia64/hp/common/sba_iommu.c:879:
+		/*
+  		** If we want to maintain the PDIR as valid, put in

WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on each line
#5620: FILE: arch/ia64/hp/common/sba_iommu.c:940:
+	/*
+ 	** Check if the PCI device can DMA to ptr... if so, just return ptr

WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on each line
#5624: FILE: arch/ia64/hp/common/sba_iommu.c:944:
+		/*
+ 		** Device is bit capable of DMA'ing to the buffer...

WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on each line
#5736: FILE: arch/ia64/hp/common/sba_iommu.c:1056:
+		/*
+		** Address does not fall w/in IOVA, must be bypassing

WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on each line
#5823: FILE: arch/ia64/hp/common/sba_iommu.c:1143:
+	/*
+ 	** Check if the PCI device can DMA to ptr... if so, just return ptr

WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on each line
#5863: FILE: arch/ia64/hp/common/sba_iommu.c:1183:
+/*
+** Since 0 is a valid pdir_base index value, can't use that

WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on each line
#5910: FILE: arch/ia64/hp/common/sba_iommu.c:1230:
+		/*
+		** Look for the start of a new DMA stream

WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on each line
#5924: FILE: arch/ia64/hp/common/sba_iommu.c:1244:
+		/*
+		** Look for a VCONTIG chunk

WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on each line
#5931: FILE: arch/ia64/hp/common/sba_iommu.c:1251:
+			/* Since multiple Vcontig blocks could make up
+			** one DMA stream, *add* cnt to dma_len.

WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on each line
#5957: FILE: arch/ia64/hp/common/sba_iommu.c:1277:
+/*
+** Two address ranges are DMA contiguous *iff* "end of prev" and

WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on each line
#5998: FILE: arch/ia64/hp/common/sba_iommu.c:1318:
+		/*
+		** Prepare for first/next DMA stream

WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on each line
#6009: FILE: arch/ia64/hp/common/sba_iommu.c:1329:
+		/*
+		** This loop terminates one iteration "early" since

WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on each line
#6024: FILE: arch/ia64/hp/common/sba_iommu.c:1344:
+			/*
+			** First make sure current dma stream won't

WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on each line
#6036: FILE: arch/ia64/hp/common/sba_iommu.c:1356:
+			/*
+			** Then look for virtually contiguous blocks.

WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on each line
#6054: FILE: arch/ia64/hp/common/sba_iommu.c:1374:
+			/*
+			** Not virtually contiguous.

WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on each line
#6070: FILE: arch/ia64/hp/common/sba_iommu.c:1390:
+			/*
+			** 3) do the entries end/start on page boundaries?

WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on each line
#6084: FILE: arch/ia64/hp/common/sba_iommu.c:1404:
+		/*
+		** End of DMA Stream

WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on each line
#6167: FILE: arch/ia64/hp/common/sba_iommu.c:1487:
+	/*
+	** First coalesce the chunks and allocate I/O pdir space

WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on each line
#6181: FILE: arch/ia64/hp/common/sba_iommu.c:1501:
+	/*
+	** Program the I/O Pdir

WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on each line
#6256: FILE: arch/ia64/hp/common/sba_iommu.c:1576:
+/**************************************************************
+*

WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on each line
#6272: FILE: arch/ia64/hp/common/sba_iommu.c:1592:
+	/*
+	** Firmware programs the base and size of a "safe IOVA space"

ERROR:SWITCH_CASE_INDENT_LEVEL: switch and case should be at the same indent
#6285: FILE: arch/ia64/hp/common/sba_iommu.c:1605:
+	switch (iovp_size) {
+		case  4*1024: tcnfg = 0; break;
+		case  8*1024: tcnfg = 1; break;
+		case 16*1024: tcnfg = 2; break;
+		case 64*1024: tcnfg = 3; break;
+		default:

WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on each line
#6312: FILE: arch/ia64/hp/common/sba_iommu.c:1632:
+	/*
+	** If an AGP device is present, only use half of the IOV space

WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on each line
#6330: FILE: arch/ia64/hp/common/sba_iommu.c:1650:
+	/*
+  	** Check to see if the spill page has been allocated, we don't need more than

WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on each line
#6351: FILE: arch/ia64/hp/common/sba_iommu.c:1671:
+	/*
+  	** Set all the PDIR entries valid w/ the spill page as the target

WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on each line
#6443: FILE: arch/ia64/hp/common/sba_iommu.c:1763:
+	/*
+	** Clear ROPE(N)_CONFIG AO bit.

WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on each line
#6519: FILE: arch/ia64/hp/common/sba_iommu.c:1839:
+/**************************************************************************
+**

WARNING:PREFER_SEQ_PUTS: Prefer seq_puts to seq_printf
#6592: FILE: arch/ia64/hp/common/sba_iommu.c:1912:
+	 seq_printf(s, "IOVA bypass disabled\n");

ERROR:SWITCH_CASE_INDENT_LEVEL: switch and case should be at the same indent
#6820: FILE: arch/ia64/hp/common/sba_iommu.c:2140:
+	switch (page_size) {
+		case 4096:
+		case 8192:
+		case 16384:
+		case 65536:
[...]
+		default:

ERROR:SPACING: space required after that ';' (ctx:VxV)
#8198: FILE: arch/ia64/include/asm/cmpxchg.h:8:
+({(__typeof__(*(ptr))) __arch_xchg((unsigned long) (x), (ptr), sizeof(*(ptr)));})
                                                                               ^

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#8524: FILE: arch/ia64/include/asm/early_ioremap.h:5:
+extern void __iomem * early_ioremap (unsigned long phys_addr, unsigned long size);

WARNING:REPEATED_WORD: Possible repeated word: 'inb'
#9592: FILE: arch/ia64/include/asm/io.h:127:
+#define inb inb

WARNING:REPEATED_WORD: Possible repeated word: 'inw'
#9603: FILE: arch/ia64/include/asm/io.h:138:
+#define inw inw

WARNING:REPEATED_WORD: Possible repeated word: 'inl'
#9614: FILE: arch/ia64/include/asm/io.h:149:
+#define inl inl

WARNING:REPEATED_WORD: Possible repeated word: 'outb'
#9625: FILE: arch/ia64/include/asm/io.h:160:
+#define outb outb

WARNING:REPEATED_WORD: Possible repeated word: 'outw'
#9634: FILE: arch/ia64/include/asm/io.h:169:
+#define outw outw

WARNING:REPEATED_WORD: Possible repeated word: 'outl'
#9643: FILE: arch/ia64/include/asm/io.h:178:
+#define outl outl

WARNING:REPEATED_WORD: Possible repeated word: 'insb'
#9652: FILE: arch/ia64/include/asm/io.h:187:
+#define insb insb

WARNING:REPEATED_WORD: Possible repeated word: 'insw'
#9661: FILE: arch/ia64/include/asm/io.h:196:
+#define insw insw

WARNING:REPEATED_WORD: Possible repeated word: 'insl'
#9670: FILE: arch/ia64/include/asm/io.h:205:
+#define insl insl

WARNING:REPEATED_WORD: Possible repeated word: 'outsb'
#9679: FILE: arch/ia64/include/asm/io.h:214:
+#define outsb outsb

WARNING:REPEATED_WORD: Possible repeated word: 'outsw'
#9689: FILE: arch/ia64/include/asm/io.h:224:
+#define outsw outsw

WARNING:REPEATED_WORD: Possible repeated word: 'outsl'
#9699: FILE: arch/ia64/include/asm/io.h:234:
+#define outsl outsl

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#9713: FILE: arch/ia64/include/asm/io.h:248:
+extern void __iomem * ioremap_uc(unsigned long offset, unsigned long size);

WARNING:REPEATED_WORD: Possible repeated word: 'iounmap'
#9718: FILE: arch/ia64/include/asm/io.h:253:
+#define iounmap iounmap

ERROR:SPACING: space required before the open parenthesis '('
#10117: FILE: arch/ia64/include/asm/kexec.h:22:
+        } while(0)

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#10648: FILE: arch/ia64/include/asm/mca.h:160:
+extern void ia64_mca_printk(const char * fmt, ...)

WARNING:ONE_SEMICOLON: Statements terminations use 1 semicolon
#10818: FILE: arch/ia64/include/asm/mca_asm.h:139:
+	;;

WARNING:ONE_SEMICOLON: Statements terminations use 1 semicolon
#10892: FILE: arch/ia64/include/asm/mca_asm.h:213:
+	;;

WARNING:ONE_SEMICOLON: Statements terminations use 1 semicolon
#11492: FILE: arch/ia64/include/asm/native/inst.h:79:
+	;;

WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on each line
#11699: FILE: arch/ia64/include/asm/numa.h:36:
+ * obtain information about memory nodes.
+*/

ERROR:SPACING: space required before the open brace '{'
#11740: FILE: arch/ia64/include/asm/numa.h:77:
+#define map_cpu_to_node(cpu, nid)	do{}while(0)

ERROR:SPACING: space required before the open parenthesis '('
#11740: FILE: arch/ia64/include/asm/numa.h:77:
+#define map_cpu_to_node(cpu, nid)	do{}while(0)

ERROR:SPACING: space required before the open brace '{'
#11741: FILE: arch/ia64/include/asm/numa.h:78:
+#define unmap_cpu_from_node(cpu, nid)	do{}while(0)

ERROR:SPACING: space required before the open parenthesis '('
#11741: FILE: arch/ia64/include/asm/numa.h:78:
+#define unmap_cpu_from_node(cpu, nid)	do{}while(0)

ERROR:SPACING: space required after that ';' (ctx:VxV)
#11869: FILE: arch/ia64/include/asm/page.h:117:
+#define __pa(x)		({ia64_va _v; _v.l = (long) (x); _v.f.reg = 0; _v.l;})
                		                                                   ^

ERROR:SPACING: space required after that ';' (ctx:VxV)
#11870: FILE: arch/ia64/include/asm/page.h:118:
+#define __va(x)		({ia64_va _v; _v.l = (long) (x); _v.f.reg = -1; _v.p;})
                		                                                    ^

ERROR:SPACING: space required after that ';' (ctx:VxV)
#11872: FILE: arch/ia64/include/asm/page.h:120:
+#define REGION_NUMBER(x)	({ia64_va _v; _v.l = (long) (x); _v.f.reg;})
                         	                                         ^

ERROR:SPACING: space required after that ';' (ctx:VxV)
#11873: FILE: arch/ia64/include/asm/page.h:121:
+#define REGION_OFFSET(x)	({ia64_va _v; _v.l = (long) (x); _v.f.off;})
                         	                                         ^

ERROR:OPEN_BRACE: open brace '{' following struct go on the same line
#13733: FILE: arch/ia64/include/asm/pal.h:1767:
+typedef struct pal_logical_to_physical_s
+{

ERROR:OPEN_BRACE: open brace '{' following struct go on the same line
#13766: FILE: arch/ia64/include/asm/pal.h:1800:
+typedef struct pal_cache_shared_info_s
+{

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#14048: FILE: arch/ia64/include/asm/pgalloc.h:34:
+p4d_populate(struct mm_struct *mm, p4d_t * p4d_entry, pud_t * pud)

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#14048: FILE: arch/ia64/include/asm/pgalloc.h:34:
+p4d_populate(struct mm_struct *mm, p4d_t * p4d_entry, pud_t * pud)

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#14057: FILE: arch/ia64/include/asm/pgalloc.h:43:
+pud_populate(struct mm_struct *mm, pud_t * pud_entry, pmd_t * pmd)

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#14057: FILE: arch/ia64/include/asm/pgalloc.h:43:
+pud_populate(struct mm_struct *mm, pud_t * pud_entry, pmd_t * pmd)

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#14065: FILE: arch/ia64/include/asm/pgalloc.h:51:
+pmd_populate(struct mm_struct *mm, pmd_t * pmd_entry, pgtable_t pte)

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#14071: FILE: arch/ia64/include/asm/pgalloc.h:57:
+pmd_populate_kernel(struct mm_struct *mm, pmd_t * pmd_entry, pte_t * pte)

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#14071: FILE: arch/ia64/include/asm/pgalloc.h:57:
+pmd_populate_kernel(struct mm_struct *mm, pmd_t * pmd_entry, pte_t * pte)

ERROR:SWITCH_CASE_INDENT_LEVEL: switch and case should be at the same indent
#14976: FILE: arch/ia64/include/asm/processor.h:341:
+	switch (regnum) {					\
+	    case 0: r = ia64_getreg(_IA64_REG_AR_KR0); break;	\
+	    case 1: r = ia64_getreg(_IA64_REG_AR_KR1); break;	\
+	    case 2: r = ia64_getreg(_IA64_REG_AR_KR2); break;	\
+	    case 3: r = ia64_getreg(_IA64_REG_AR_KR3); break;	\
+	    case 4: r = ia64_getreg(_IA64_REG_AR_KR4); break;	\
+	    case 5: r = ia64_getreg(_IA64_REG_AR_KR5); break;	\
+	    case 6: r = ia64_getreg(_IA64_REG_AR_KR6); break;	\
+	    case 7: r = ia64_getreg(_IA64_REG_AR_KR7); break;	\
+	    default: ia64_getreg_unknown_kr(); break;		\

ERROR:SWITCH_CASE_INDENT_LEVEL: switch and case should be at the same indent
#14992: FILE: arch/ia64/include/asm/processor.h:357:
+	switch (regnum) {					\
+	    case 0: ia64_setreg(_IA64_REG_AR_KR0, r); break;	\
+	    case 1: ia64_setreg(_IA64_REG_AR_KR1, r); break;	\
+	    case 2: ia64_setreg(_IA64_REG_AR_KR2, r); break;	\
+	    case 3: ia64_setreg(_IA64_REG_AR_KR3, r); break;	\
+	    case 4: ia64_setreg(_IA64_REG_AR_KR4, r); break;	\
+	    case 5: ia64_setreg(_IA64_REG_AR_KR5, r); break;	\
+	    case 6: ia64_setreg(_IA64_REG_AR_KR6, r); break;	\
+	    case 7: ia64_setreg(_IA64_REG_AR_KR7, r); break;	\
+	    default: ia64_setreg_unknown_kr(); break;		\

WARNING:SPACING: space prohibited before semicolon
#15686: FILE: arch/ia64/include/asm/sal.h:233:
+} ia64_sal_desc_ap_wakeup_t ;

ERROR:SWITCH_CASE_INDENT_LEVEL: switch and case should be at the same indent
#17890: FILE: arch/ia64/include/asm/uaccess.h:143:
+		switch (__gu_size) {							\
+		      case 1: __get_user_size(__gu_val, __gu_ptr, 1, __gu_err); break;	\
+		      case 2: __get_user_size(__gu_val, __gu_ptr, 2, __gu_err); break;	\
+		      case 4: __get_user_size(__gu_val, __gu_ptr, 4, __gu_err); break;	\
+		      case 8: __get_user_size(__gu_val, __gu_ptr, 8, __gu_err); break;	\
+		      default: __get_user_unknown(); break;				\

ERROR:SWITCH_CASE_INDENT_LEVEL: switch and case should be at the same indent
#17918: FILE: arch/ia64/include/asm/uaccess.h:171:
+		switch (__pu_size) {							\
+		      case 1: __put_user_size(__pu_x, __pu_ptr, 1, __pu_err); break;	\
+		      case 2: __put_user_size(__pu_x, __pu_ptr, 2, __pu_err); break;	\
+		      case 4: __put_user_size(__pu_x, __pu_ptr, 4, __pu_err); break;	\
+		      case 8: __put_user_size(__pu_x, __pu_ptr, 8, __pu_err); break;	\
+		      default: __put_user_unknown(); break;				\

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#17973: FILE: arch/ia64/include/asm/uaccess.h:226:
+	const char __user * __sfu_from = (from);			\

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#19652: FILE: arch/ia64/include/asm/xor.h:7:
+extern void xor_ia64_2(unsigned long bytes, unsigned long * __restrict p1,

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#19653: FILE: arch/ia64/include/asm/xor.h:8:
+		       const unsigned long * __restrict p2);

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#19654: FILE: arch/ia64/include/asm/xor.h:9:
+extern void xor_ia64_3(unsigned long bytes, unsigned long * __restrict p1,

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#19655: FILE: arch/ia64/include/asm/xor.h:10:
+		       const unsigned long * __restrict p2,

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#19656: FILE: arch/ia64/include/asm/xor.h:11:
+		       const unsigned long * __restrict p3);

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#19657: FILE: arch/ia64/include/asm/xor.h:12:
+extern void xor_ia64_4(unsigned long bytes, unsigned long * __restrict p1,

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#19658: FILE: arch/ia64/include/asm/xor.h:13:
+		       const unsigned long * __restrict p2,

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#19659: FILE: arch/ia64/include/asm/xor.h:14:
+		       const unsigned long * __restrict p3,

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#19660: FILE: arch/ia64/include/asm/xor.h:15:
+		       const unsigned long * __restrict p4);

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#19661: FILE: arch/ia64/include/asm/xor.h:16:
+extern void xor_ia64_5(unsigned long bytes, unsigned long * __restrict p1,

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#19662: FILE: arch/ia64/include/asm/xor.h:17:
+		       const unsigned long * __restrict p2,

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#19663: FILE: arch/ia64/include/asm/xor.h:18:
+		       const unsigned long * __restrict p3,

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#19664: FILE: arch/ia64/include/asm/xor.h:19:
+		       const unsigned long * __restrict p4,

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#19665: FILE: arch/ia64/include/asm/xor.h:20:
+		       const unsigned long * __restrict p5);

ERROR:SPACING: space required after that ';' (ctx:VxV)
#19872: FILE: arch/ia64/include/uapi/asm/cmpxchg.h:54:
+({(__typeof__(*(ptr))) __arch_xchg((unsigned long) (x), (ptr), sizeof(*(ptr)));})
                                                                               ^

ERROR:SWITCH_CASE_INDENT_LEVEL: switch and case should be at the same indent
#20092: FILE: arch/ia64/include/uapi/asm/gcc_intrin.h:36:
+	switch (regnum) {							\
+	    case _IA64_REG_PSR_L:						\
[...]
+	    case _IA64_REG_AR_KR0 ... _IA64_REG_AR_EC:				\
[...]
+	    case _IA64_REG_CR_DCR ... _IA64_REG_CR_LRR1:			\
[...]
+	    case _IA64_REG_SP:							\
[...]
+	    case _IA64_REG_GP:							\
[...]
+	    default:								\

ERROR:SWITCH_CASE_INDENT_LEVEL: switch and case should be at the same indent
#20826: FILE: arch/ia64/include/uapi/asm/intrinsics.h:38:
+	switch (sz) {								\
+	      case 4:								\
[...]
+	      case 8:								\
[...]
+	      default:								\

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#22370: FILE: arch/ia64/kernel/acpi.c:89:
+acpi_parse_lapic_addr_ovr(union acpi_subtable_headers * header,

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#22409: FILE: arch/ia64/kernel/acpi.c:128:
+acpi_parse_lapic_nmi(union acpi_subtable_headers * header, const unsigned long end)

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#22423: FILE: arch/ia64/kernel/acpi.c:142:
+acpi_parse_iosapic(union acpi_subtable_headers * header, const unsigned long end)

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#22438: FILE: arch/ia64/kernel/acpi.c:157:
+acpi_parse_plat_int_src(union acpi_subtable_headers * header,

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#22522: FILE: arch/ia64/kernel/acpi.c:241:
+acpi_parse_int_src_ovr(union acpi_subtable_headers * header,

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#22543: FILE: arch/ia64/kernel/acpi.c:262:
+acpi_parse_nmi_src(union acpi_subtable_headers * header, const unsigned long end)

ERROR:RETURN_PARENTHESES: return is not a function, parentheses are not required
#23081: FILE: arch/ia64/kernel/acpi.c:800:
+	return (0);

ERROR:SPACING: space required before the open parenthesis '('
#23534: FILE: arch/ia64/kernel/audit.c:39:
+	switch(syscall) {

ERROR:SWITCH_CASE_INDENT_LEVEL: switch and case should be at the same indent
#23655: FILE: arch/ia64/kernel/brl_emu.c:91:
+	switch(opcode) {
[...]
+		case 0xC:
[...]
+		case 0xD:
[...]
+		default:

ERROR:SPACING: space required before the open parenthesis '('
#23655: FILE: arch/ia64/kernel/brl_emu.c:91:
+	switch(opcode) {

ERROR:SWITCH_CASE_INDENT_LEVEL: switch and case should be at the same indent
#23692: FILE: arch/ia64/kernel/brl_emu.c:128:
+			switch(btype) {
+				case 0:
[...]
+				case 1:
[...]
+				case 2:
[...]
+				case 3:
[...]
+				case 4:
[...]
+				case 5:
[...]
+				case 6:
[...]
+				case 7:

ERROR:SPACING: space required before the open parenthesis '('
#23692: FILE: arch/ia64/kernel/brl_emu.c:128:
+			switch(btype) {

ERROR:SPACING: space required before the open parenthesis '('
#23857: FILE: arch/ia64/kernel/crash.c:70:
+	while(timeout-- > 0) {

ERROR:SPACING: space required before the open parenthesis '('
#24035: FILE: arch/ia64/kernel/crash.c:248:
+	if((ret = register_die_notifier(&kdump_init_notifier_nb)) != 0)

ERROR:SPACING: space required before the open brace '{'
#24137: FILE: arch/ia64/kernel/cyclone.c:54:
+	if(!reg){

ERROR:SPACING: space required before the open parenthesis '('
#24137: FILE: arch/ia64/kernel/cyclone.c:54:
+	if(!reg){

ERROR:SPACING: space required before the open brace '{'
#24145: FILE: arch/ia64/kernel/cyclone.c:62:
+	if(!base){

ERROR:SPACING: space required before the open parenthesis '('
#24145: FILE: arch/ia64/kernel/cyclone.c:62:
+	if(!base){

ERROR:SPACING: space required before the open brace '{'
#24155: FILE: arch/ia64/kernel/cyclone.c:72:
+	if(!reg){

ERROR:SPACING: space required before the open parenthesis '('
#24155: FILE: arch/ia64/kernel/cyclone.c:72:
+	if(!reg){

ERROR:SPACING: space required before the open brace '{'
#24167: FILE: arch/ia64/kernel/cyclone.c:84:
+	if(!reg){

ERROR:SPACING: space required before the open parenthesis '('
#24167: FILE: arch/ia64/kernel/cyclone.c:84:
+	if(!reg){

ERROR:SPACING: space required before the open brace '{'
#24179: FILE: arch/ia64/kernel/cyclone.c:96:
+	if(!cyclone_timer){

ERROR:SPACING: space required before the open parenthesis '('
#24179: FILE: arch/ia64/kernel/cyclone.c:96:
+	if(!cyclone_timer){

ERROR:SPACING: space required before the open brace '{'
#24187: FILE: arch/ia64/kernel/cyclone.c:104:
+	for(i=0; i<3; i++){

ERROR:SPACING: space required before the open parenthesis '('
#24187: FILE: arch/ia64/kernel/cyclone.c:104:
+	for(i=0; i<3; i++){

ERROR:SPACING: space required before the open parenthesis '('
#24190: FILE: arch/ia64/kernel/cyclone.c:107:
+		while(stall--) barrier();

ERROR:SPACING: space required before the open brace '{'
#24191: FILE: arch/ia64/kernel/cyclone.c:108:
+		if(readl(cyclone_timer) == old){

ERROR:SPACING: space required before the open parenthesis '('
#24191: FILE: arch/ia64/kernel/cyclone.c:108:
+		if(readl(cyclone_timer) == old){

ERROR:SWITCH_CASE_INDENT_LEVEL: switch and case should be at the same indent
#24503: FILE: arch/ia64/kernel/efi.c:274:
+	switch (md->type) {
+	      case EFI_LOADER_CODE:
+	      case EFI_LOADER_DATA:
+	      case EFI_BOOT_SERVICES_CODE:
+	      case EFI_BOOT_SERVICES_DATA:
+	      case EFI_CONVENTIONAL_MEMORY:

ERROR:SWITCH_CASE_INDENT_LEVEL: switch and case should be at the same indent
#25426: FILE: arch/ia64/kernel/efi.c:1197:
+		switch (md->type) {
[...]
+			case EFI_MEMORY_MAPPED_IO:
+			case EFI_MEMORY_MAPPED_IO_PORT_SPACE:
[...]
+			case EFI_LOADER_CODE:
+			case EFI_LOADER_DATA:
+			case EFI_BOOT_SERVICES_DATA:
+			case EFI_BOOT_SERVICES_CODE:
+			case EFI_CONVENTIONAL_MEMORY:
[...]
+			case EFI_ACPI_MEMORY_NVS:
[...]
+			case EFI_UNUSABLE_MEMORY:
[...]
+			case EFI_PERSISTENT_MEMORY:
[...]
+			case EFI_RESERVED_TYPE:
+			case EFI_RUNTIME_SERVICES_CODE:
+			case EFI_RUNTIME_SERVICES_DATA:
+			case EFI_ACPI_RECLAIM_MEMORY:
+			default:

WARNING:REPEATED_WORD: Possible repeated word: 'in'
#25789: FILE: arch/ia64/kernel/entry.S:18:
+ * ia64_switch_to now places correct virtual mapping in in TR2 for

ERROR:SPACING: space required before that '-' (ctx:OxV)
#27274: FILE: arch/ia64/kernel/entry.h:70:
+	adds sp=-IA64_SWITCH_STACK_SIZE,sp;	\
 	        ^

ERROR:SWITCH_CASE_INDENT_LEVEL: switch and case should be at the same indent
#27389: FILE: arch/ia64/kernel/err_inject.c:96:
+	switch (call_start) {
+	    case 0: /* Do nothing. */
[...]
+	    case 1: /* Call pal_mc_error_inject in physical mode. */
[...]
+	    case 2: /* Call pal_mc_error_inject in virtual mode. */
[...]
+	    default:

ERROR:SWITCH_CASE_INDENT_LEVEL: switch and case should be at the same indent
#27643: FILE: arch/ia64/kernel/esi.c:71:
+		switch (*p) {
+		      case ESI_DESC_ENTRY_POINT:
[...]
+		      default:

ERROR:SPACING: space required before the open brace '{'
#31224: FILE: arch/ia64/kernel/iosapic.c:585:
+		    (info->trigger != trigger || info->polarity != polarity)){

ERROR:SPACING: space required before the open parenthesis '('
#31371: FILE: arch/ia64/kernel/iosapic.c:732:
+		if(iosapic_intr_info[irq].count == 0) {

ERROR:SWITCH_CASE_INDENT_LEVEL: switch and case should be at the same indent
#31505: FILE: arch/ia64/kernel/iosapic.c:866:
+	switch (int_type) {
+	      case ACPI_INTERRUPT_PMI:
[...]
+	      case ACPI_INTERRUPT_INIT:
[...]
+	      case ACPI_INTERRUPT_CPEI:
[...]
+	      default:

WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on each line
#32637: FILE: arch/ia64/kernel/irq_lsapic.c:8:
+ * (LSAPIC), such as the ITC and IPI interrupts.
+    *

WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on each line
#32638: FILE: arch/ia64/kernel/irq_lsapic.c:9:
+    *
+ * Copyright (C) 1999 VA Linux Systems

ERROR:SWITCH_CASE_INDENT_LEVEL: switch and case should be at the same indent
#34480: FILE: arch/ia64/kernel/kprobes.c:106:
+		switch (major_opcode) {
+		  case INDIRECT_CALL_OPCODE:
[...]
+		  case IP_RELATIVE_PREDICT_OPCODE:
+		  case IP_RELATIVE_BRANCH_OPCODE:
[...]
+		  case IP_RELATIVE_CALL_OPCODE:

ERROR:SWITCH_CASE_INDENT_LEVEL: switch and case should be at the same indent
#34496: FILE: arch/ia64/kernel/kprobes.c:122:
+		switch (major_opcode) {
+		  case LONG_CALL_OPCODE:

WARNING:REPEATED_WORD: Possible repeated word: 'Register'
#34529: FILE: arch/ia64/kernel/kprobes.c:155:
+		/* Integer compare - Register Register (A6 type)*/

ERROR:SWITCH_CASE_INDENT_LEVEL: switch and case should be at the same indent
#34674: FILE: arch/ia64/kernel/kprobes.c:300:
+	switch (slot) {
+	  case 0:
[...]
+	  case 1:
[...]
+	  case 2:

ERROR:SWITCH_CASE_INDENT_LEVEL: switch and case should be at the same indent
#34703: FILE: arch/ia64/kernel/kprobes.c:329:
+	switch (slot) {
+	  case 0:
[...]
+	  case 1:
[...]
+	  case 2:

ERROR:SPACING: space required before the open parenthesis '('
#34877: FILE: arch/ia64/kernel/kprobes.c:503:
+	if(valid_kprobe_addr(template, slot, addr))

ERROR:SWITCH_CASE_INDENT_LEVEL: switch and case should be at the same indent
#34917: FILE: arch/ia64/kernel/kprobes.c:543:
+	switch (p->ainsn.slot) {
+		case 0:
[...]
+		case 1:
[...]
+		case 2:

ERROR:SWITCH_CASE_INDENT_LEVEL: switch and case should be at the same indent
#34940: FILE: arch/ia64/kernel/kprobes.c:566:
+	switch (p->ainsn.slot) {
+		case 0:
[...]
+		case 1:
[...]
+		case 2:

ERROR:SPACING: space required before the open parenthesis '('
#35200: FILE: arch/ia64/kernel/kprobes.c:826:
+	switch(kcb->kprobe_status) {

ERROR:SPACING: space required before the open parenthesis '('
#35247: FILE: arch/ia64/kernel/kprobes.c:873:
+	switch(val) {

ERROR:SPACING: space required before the open parenthesis '('
#35432: FILE: arch/ia64/kernel/machine_kexec.c:141:
+	for(;;);

ERROR:OPEN_BRACE: open brace '{' following struct go on the same line
#35813: FILE: arch/ia64/kernel/mca.c:353:
+typedef struct ia64_state_log_s
+{

ERROR:SPACING: space required after that ';' (ctx:OxV)
#35829: FILE: arch/ia64/kernel/mca.c:369:
+    ia64_state_log[it].isl_count++;}
                                   ^

WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on each line
#36682: FILE: arch/ia64/kernel/mca.c:1222:
+ *
+*/

ERROR:SPACING: space required before the open parenthesis '('
#37367: FILE: arch/ia64/kernel/mca.c:1907:
+	for(i = 0 ; i < NR_CPUS; i++)

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#38912: FILE: arch/ia64/kernel/mca_drv.c:206:
+		(slpi->valid.cpuid_info ? ((char*)slpi + head_size) : NULL);

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#38915: FILE: arch/ia64/kernel/mca_drv.c:209:
+			((char*)slpi + head_size + mid_size) : NULL);

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#38936: FILE: arch/ia64/kernel/mca_drv.c:230:
+	int record_len = ((sal_log_record_header_t*)buffer)->len;

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#38966: FILE: arch/ia64/kernel/mca_drv.c:260:
+		sp = (sal_log_section_hdr_t *)((char*)buffer + ercd_pos);

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#39085: FILE: arch/ia64/kernel/mca_drv.c:379:
+		(pal_processor_state_info_t*)peidx_psp(peidx);

ERROR:SWITCH_CASE_INDENT_LEVEL: switch and case should be at the same indent
#39094: FILE: arch/ia64/kernel/mca_drv.c:388:
+	switch (sos->rv_rc) {
+		case -1: /* SAL rendezvous unsuccessful */
[...]
+		case  0: /* SAL rendezvous not required */
[...]
+		case  1: /* SAL rendezvous successful int */
+		case  2: /* SAL rendezvous successful int with init */
+		default:

ERROR:SWITCH_CASE_INDENT_LEVEL: switch and case should be at the same indent
#39131: FILE: arch/ia64/kernel/mca_drv.c:425:
+		switch (pbci->bsi) {
+			case 0:
[...]
+			case 1:
+			case 2:
+			case 3:

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#39207: FILE: arch/ia64/kernel/mca_drv.c:501:
+	ia64_fptr_t *mca_hdlr_bh = (ia64_fptr_t*)mca_handler_bhhook;

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#39288: FILE: arch/ia64/kernel/mca_drv.c:582:
+		(pal_processor_state_info_t*)peidx_psp(peidx);

ERROR:SPACING: space required before the open parenthesis '('
#39291: FILE: arch/ia64/kernel/mca_drv.c:585:
+		switch(pbci->type) {

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#39364: FILE: arch/ia64/kernel/mca_drv.c:658:
+		(pal_processor_state_info_t*)peidx_psp(peidx);

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#39455: FILE: arch/ia64/kernel/mca_drv.c:749:
+	mca_make_peidx((sal_log_processor_info_t*)

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#39459: FILE: arch/ia64/kernel/mca_drv.c:753:
+	*((u64*)&pbci) = peidx_check_info(&peidx, bus_check, 0);

WARNING:ONE_SEMICOLON: Statements terminations use 1 semicolon
#39713: FILE: arch/ia64/kernel/minstate.h:14:
+	;;

ERROR:SPACING: space required before that '-' (ctx:OxV)
#39762: FILE: arch/ia64/kernel/minstate.h:63:
+	adds r1=-IA64_TASK_THREAD_ON_USTACK_OFFSET,r16						\
 	        ^

ERROR:SPACING: space required before that '-' (ctx:OxV)
#39780: FILE: arch/ia64/kernel/minstate.h:81:
+(pKStk) addl r1=-IA64_PT_REGS_SIZE,r1;			/* if in kernel mode, use sp (r12) */	\
                 ^

ERROR:SPACING: space required before that '-' (ctx:OxV)
#39831: FILE: arch/ia64/kernel/minstate.h:132:
+	adds r12=-16,r1;	/* switch to kernel memory stack (with 16 bytes of scratch) */	\
 	         ^

WARNING:ONE_SEMICOLON: Statements terminations use 1 semicolon
#39850: FILE: arch/ia64/kernel/minstate.h:151:
+	;;

WARNING:ONE_SEMICOLON: Statements terminations use 1 semicolon
#39912: FILE: arch/ia64/kernel/minstate.h:213:
+	;;

ERROR:SWITCH_CASE_INDENT_LEVEL: switch and case should be at the same indent
#40297: FILE: arch/ia64/kernel/module.c:341:
+		switch (ELF64_R_TYPE(rela[i].r_info)) {
+		      case R_IA64_LTOFF22:
+		      case R_IA64_LTOFF22X:
+		      case R_IA64_LTOFF64I:
+		      case R_IA64_LTOFF_FPTR22:
+		      case R_IA64_LTOFF_FPTR64I:
+		      case R_IA64_LTOFF_FPTR32MSB:
+		      case R_IA64_LTOFF_FPTR32LSB:
+		      case R_IA64_LTOFF_FPTR64MSB:
+		      case R_IA64_LTOFF_FPTR64LSB:

ERROR:SWITCH_CASE_INDENT_LEVEL: switch and case should be at the same indent
#40324: FILE: arch/ia64/kernel/module.c:368:
+		switch (ELF64_R_TYPE(rela[i].r_info)) {
+		      case R_IA64_PCREL21B:
+		      case R_IA64_PLTOFF22:
+		      case R_IA64_PLTOFF64I:
+		      case R_IA64_PLTOFF64MSB:
+		      case R_IA64_PLTOFF64LSB:
+		      case R_IA64_IPLTMSB:
+		      case R_IA64_IPLTLSB:

ERROR:SWITCH_CASE_INDENT_LEVEL: switch and case should be at the same indent
#40349: FILE: arch/ia64/kernel/module.c:393:
+		switch (ELF64_R_TYPE(rela[i].r_info)) {
+		      case R_IA64_FPTR64I:
+		      case R_IA64_FPTR32LSB:
+		      case R_IA64_FPTR32MSB:
+		      case R_IA64_FPTR64LSB:
+		      case R_IA64_FPTR64MSB:
+		      case R_IA64_LTOFF_FPTR22:
+		      case R_IA64_LTOFF_FPTR32LSB:
+		      case R_IA64_LTOFF_FPTR32MSB:
+		      case R_IA64_LTOFF_FPTR64I:
+		      case R_IA64_LTOFF_FPTR64LSB:
+		      case R_IA64_LTOFF_FPTR64MSB:
+		      case R_IA64_IPLTMSB:
+		      case R_IA64_IPLTLSB:
[...]
+		      case R_IA64_PCREL21B:

ERROR:SWITCH_CASE_INDENT_LEVEL: switch and case should be at the same indent
#40585: FILE: arch/ia64/kernel/module.c:629:
+	switch (formula) {
+	      case RV_SEGREL:	/* segment base is arbitrarily chosen to be 0 for kernel modules */
+	      case RV_DIRECT:
[...]
+	      case RV_GPREL:	  val -= mod->arch.gp; break;
+	      case RV_LTREL:	  val = get_ltoff(mod, val, &ok); break;
+	      case RV_PLTREL:	  val = get_plt(mod, location, val, &ok); break;
+	      case RV_FPTR:	  val = get_fdesc(mod, val, &ok); break;
+	      case RV_SECREL:	  val -= sec->sh_addr; break;
+	      case RV_LTREL_FPTR: val = get_ltoff(mod, get_fdesc(mod, val, &ok), &ok); break;
[...]
+	      case RV_PCREL:
[...]
+	      case RV_BDREL:
[...]
+	      case RV_LTV:
[...]
+	      case RV_PCREL2:
[...]
+	      case RV_SPECIAL:
[...]
+	      case RV_TPREL:
+	      case RV_LTREL_TPREL:
+	      case RV_DTPMOD:
+	      case RV_LTREL_DTPMOD:
+	      case RV_DTPREL:
+	      case RV_LTREL_DTPREL:
[...]
+	      default:

ERROR:SWITCH_CASE_INDENT_LEVEL: switch and case should be at the same indent
#40598: FILE: arch/ia64/kernel/module.c:642:
+		switch (r_type) {
+		      case R_IA64_PCREL21B:
[...]
+		      default:
[...]
+		      case R_IA64_PCREL32MSB:
+		      case R_IA64_PCREL32LSB:
+		      case R_IA64_PCREL64MSB:
+		      case R_IA64_PCREL64LSB:

ERROR:SWITCH_CASE_INDENT_LEVEL: switch and case should be at the same indent
#40626: FILE: arch/ia64/kernel/module.c:670:
+		switch (r_type) {
+		      case R_IA64_PCREL60B: format = RF_INSN60; break;
+		      case R_IA64_PCREL21B: format = RF_INSN21B; break;
+		      case R_IA64_PCREL21M: format = RF_INSN21M; break;
+		      case R_IA64_PCREL21F: format = RF_INSN21F; break;
+		      default: break;

ERROR:SWITCH_CASE_INDENT_LEVEL: switch and case should be at the same indent
#40659: FILE: arch/ia64/kernel/module.c:703:
+		switch (r_type) {
+		      case R_IA64_IPLTMSB:
+		      case R_IA64_IPLTLSB:
[...]
+		      case R_IA64_SUB:
[...]
+		      case R_IA64_LTOFF22X:
[...]
+		      case R_IA64_LDXMOV:
[...]
+		      default:

ERROR:SWITCH_CASE_INDENT_LEVEL: switch and case should be at the same indent
#40721: FILE: arch/ia64/kernel/module.c:765:
+	switch (format) {
+	      case RF_INSN21B:	ok = apply_imm21b(mod, location, (int64_t) val / 16); break;
+	      case RF_INSN22:	ok = apply_imm22(mod, location, val); break;
+	      case RF_INSN64:	ok = apply_imm64(mod, location, val); break;
+	      case RF_INSN60:	ok = apply_imm60(mod, location, (int64_t) val / 16); break;
+	      case RF_32LSB:	put_unaligned(val, (uint32_t *) location); break;
+	      case RF_64LSB:	put_unaligned(val, (uint64_t *) location); break;
+	      case RF_32MSB:	/* ia64 Linux is little-endian... */
+	      case RF_64MSB:	/* ia64 Linux is little-endian... */
+	      case RF_INSN14:	/* must be within-module, i.e., resolved by "ld -r" */
+	      case RF_INSN21M:	/* must be within-module, i.e., resolved by "ld -r" */
+	      case RF_INSN21F:	/* must be within-module, i.e., resolved by "ld -r" */
[...]
+	      default:

ERROR:SPACING: space required before the open parenthesis '('
#41186: FILE: arch/ia64/kernel/numa.c:61:
+	for(node=0; node < MAX_NUMNODES; node++)

ERROR:SPACING: space required before the open parenthesis '('
#41674: FILE: arch/ia64/kernel/palinfo.c:158:
+	for(; i < max; i++ ) {

ERROR:SPACING: space required before the open parenthesis '('
#41778: FILE: arch/ia64/kernel/palinfo.c:262:
+			for(k=0; k < 8; k++ ) {

ERROR:SPACING: space required before the open parenthesis '('
#41785: FILE: arch/ia64/kernel/palinfo.c:269:
+			for(k=0; k < 8; k++ ) {

ERROR:SPACING: space required before the open parenthesis '('
#41894: FILE: arch/ia64/kernel/palinfo.c:378:
+		for(i=0; i < vm_info_1.pal_vm_info_1_s.num_tc_levels; i++) {

ERROR:SPACING: space required before the open parenthesis '('
#41950: FILE: arch/ia64/kernel/palinfo.c:434:
+	for(info=0; info < 4; info++) {

ERROR:SPACING: space required before the open parenthesis '('
#42042: FILE: arch/ia64/kernel/palinfo.c:526:
+	for(i=0; i < 64; i++, avail >>=1, status >>=1, control >>=1) {

ERROR:SPACING: space required before the open parenthesis '('
#42086: FILE: arch/ia64/kernel/palinfo.c:570:
+	} while(1);

ERROR:SPACING: space required before the open parenthesis '('
#42132: FILE: arch/ia64/kernel/palinfo.c:616:
+	for(i=0; i < 64; i++, v++, avail >>=1, status >>=1, control >>=1) {

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#42685: FILE: arch/ia64/kernel/patch.c:221:
+	s32 * offp = (s32 *) __start___phys_stack_reg_patchlist;

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#42686: FILE: arch/ia64/kernel/patch.c:222:
+	s32 * end = (s32 *) __end___phys_stack_reg_patchlist;

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#43063: FILE: arch/ia64/kernel/process.c:195:
+static int __init nohalt_setup(char * str)

ERROR:SWITCH_CASE_INDENT_LEVEL: switch and case should be at the same indent
#45880: FILE: arch/ia64/kernel/sal.c:50:
+	switch (status) {
+	      case 0: str = "Call completed without error"; break;
+	      case 1: str = "Effect a warm boot of the system to complete "
[...]
+	      case -1: str = "Not implemented"; break;
+	      case -2: str = "Invalid argument"; break;
+	      case -3: str = "Call completed with error"; break;
+	      case -4: str = "Virtual address not registered"; break;
+	      case -5: str = "No information available"; break;
+	      case -6: str = "Insufficient space to add the entry"; break;
+	      case -7: str = "Invalid entry_addr value"; break;
+	      case -8: str = "Invalid interrupt vector"; break;
+	      case -9: str = "Requested memory not available"; break;
+	      case -10: str = "Unable to write to the NVM device"; break;
+	      case -11: str = "Invalid partition type specified"; break;
+	      case -12: str = "Invalid NVM_Object id specified"; break;
+	      case -13: str = "NVM_Object already has the maximum number "
[...]
+	      case -14: str = "Insufficient space in partition for the "
[...]
+	      case -15: str = "Insufficient data buffer space for the "
[...]
+	      case -16: str = "Scratch buffer required for the write/delete "
[...]
+	      case -17: str = "Insufficient space in the NVM_Object for the "
[...]
+	      case -18: str = "Invalid value specified in the partition_rec "
[...]
+	      case -19: str = "Record oriented I/O not supported for this "
[...]
+	      case -20: str = "Bad format of record to be written or "
[...]
+	      default: str = "Unknown SAL status code"; break;

WARNING:PREFER_SEQ_PUTS: Prefer seq_puts to seq_printf
#47617: FILE: arch/ia64/kernel/setup.c:729:
+	seq_printf(m,"\n");

ERROR:SWITCH_CASE_INDENT_LEVEL: switch and case should be at the same indent
#47665: FILE: arch/ia64/kernel/setup.c:777:
+		else if (family == 0x1f) switch (model) {
+			case 0: memcpy(brand, "McKinley", 9); break;
+			case 1: memcpy(brand, "Madison", 8); break;
+			case 2: memcpy(brand, "Madison up to 9M cache", 23); break;

ERROR:SPACING: space required before the open parenthesis '('
#48638: FILE: arch/ia64/kernel/smp.c:213:
+			if(kdump_status[cpu] == 0)

ERROR:SPACING: space required before the open parenthesis '('
#48704: FILE: arch/ia64/kernel/smp.c:279:
+		while(counts[cpu] == (local_tlb_flush_counts[cpu].count & 0xffff))

ERROR:SPACING: space required before the open parenthesis '('
#50826: FILE: arch/ia64/kernel/topology.c:78:
+		if((err = arch_register_cpu(i)))

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#50876: FILE: arch/ia64/kernel/topology.c:128:
+		struct cache_info * this_leaf)

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#50911: FILE: arch/ia64/kernel/topology.c:163:
+		struct cache_info * this_leaf)

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#50994: FILE: arch/ia64/kernel/topology.c:246:
+static struct attribute * cache_default_attrs[] = {

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#51010: FILE: arch/ia64/kernel/topology.c:262:
+static ssize_t ia64_cache_show(struct kobject * kobj, struct attribute * attr, char * buf)

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#51010: FILE: arch/ia64/kernel/topology.c:262:
+static ssize_t ia64_cache_show(struct kobject * kobj, struct attribute * attr, char * buf)

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#51010: FILE: arch/ia64/kernel/topology.c:262:
+static ssize_t ia64_cache_show(struct kobject * kobj, struct attribute * attr, char * buf)

ERROR:SWITCH_CASE_INDENT_LEVEL: switch and case should be at the same indent
#51269: FILE: arch/ia64/kernel/traps.c:105:
+	switch (break_num) {
+	      case 0: /* unknown error (used by GCC for __builtin_abort()) */
[...]
+	      case 1: /* integer divide by zero */
[...]
+	      case 2: /* integer overflow */
[...]
+	      case 3: /* range check/bounds check */
[...]
+	      case 4: /* null pointer dereference */
[...]
+	      case 5: /* misaligned data */
[...]
+	      case 6: /* decimal overflow */
[...]
+	      case 7: /* decimal divide by zero */
[...]
+	      case 8: /* packed decimal error */
[...]
+	      case 9: /* invalid ASCII digit */
[...]
+	      case 10: /* invalid decimal digit */
[...]
+	      case 11: /* paragraph stack overflow */
[...]
+	      case 0x3f000 ... 0x3ffff:	/* bundle-update in progress */
[...]
+	      default:

WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on each line
#51513: FILE: arch/ia64/kernel/traps.c:349:
+				/* denormal operand gets the same si_code as underflow 
+				* see arch/i386/kernel/traps.c:math_error()  */

ERROR:SWITCH_CASE_INDENT_LEVEL: switch and case should be at the same indent
#51609: FILE: arch/ia64/kernel/traps.c:445:
+	switch (vector) {
+	      case 24: /* General Exception */
[...]
+	      case 25: /* Disabled FP-Register */
[...]
+	      case 26: /* NaT Consumption */
[...]
+	      case 31: /* Unsupported Data Reference */
[...]
+	      case 29: /* Debug */
+	      case 35: /* Taken Branch Trap */
+	      case 36: /* Single Step Trap */
[...]
+	      case 32: /* fp fault */
+	      case 33: /* fp trap */
[...]
+	      case 34:
[...]
+	      case 45:
[...]
+	      case 46:
[...]
+	      case 47:
[...]
+	      default:

ERROR:SWITCH_CASE_INDENT_LEVEL: switch and case should be at the same indent
#51689: FILE: arch/ia64/kernel/traps.c:525:
+		switch (vector) {
+		      default:
+		      case 29:
[...]
+		      case 35: si_code = TRAP_BRANCH; ifa = 0; break;
+		      case 36: si_code = TRAP_TRACE; ifa = 0; break;

ERROR:SPACING: space required before that '&' (ctx:OxV)
#52267: FILE: arch/ia64/kernel/unaligned.c:485:
+	       addr, unat==&sw->ar_unat ? "yes":"no", GR_OFFS(regnum));
 	                   ^

ERROR:SPACING: space required before that '*' (ctx:OxV)
#52287: FILE: arch/ia64/kernel/unaligned.c:505:
+	DPRINT("*0x%lx=0x%lx NaT=%d new unat: %p=%lx\n", addr, val, nat, (void *) unat,*unat);
 	                                                                               ^

ERROR:SPACING: space required before the open parenthesis '('
#52385: FILE: arch/ia64/kernel/unaligned.c:603:
+		switch(regnum) {

ERROR:SWITCH_CASE_INDENT_LEVEL: switch and case should be at the same indent
#52862: FILE: arch/ia64/kernel/unaligned.c:1080:
+		switch( ld.x6_sz ) {
+			case 0:
[...]
+			case 1:
[...]
+			case 2:
[...]
+			case 3:

ERROR:SPACING: space required before the open parenthesis '('
#52862: FILE: arch/ia64/kernel/unaligned.c:1080:
+		switch( ld.x6_sz ) {

ERROR:SWITCH_CASE_INDENT_LEVEL: switch and case should be at the same indent
#52963: FILE: arch/ia64/kernel/unaligned.c:1181:
+		switch( ld.x6_sz ) {
+			case 0:
[...]
+			case 1:
[...]
+			case 2:
[...]
+			case 3:

ERROR:SPACING: space required before the open parenthesis '('
#52963: FILE: arch/ia64/kernel/unaligned.c:1181:
+		switch( ld.x6_sz ) {

ERROR:SWITCH_CASE_INDENT_LEVEL: switch and case should be at the same indent
#53030: FILE: arch/ia64/kernel/unaligned.c:1248:
+	switch( ld.x6_sz ) {
+		case 0:
[...]
+		case 1:
[...]
+		case 2:
[...]
+		case 3:

ERROR:SPACING: space required before the open parenthesis '('
#53030: FILE: arch/ia64/kernel/unaligned.c:1248:
+	switch( ld.x6_sz ) {

ERROR:SWITCH_CASE_INDENT_LEVEL: switch and case should be at the same indent
#53183: FILE: arch/ia64/kernel/unaligned.c:1401:
+	switch (ipsr->ri) {
+	      default:
+	      case 0: u.l = (bundle[0] >>  5); break;
+	      case 1: u.l = (bundle[0] >> 46) | (bundle[1] << 18); break;
+	      case 2: u.l = (bundle[1] >> 23); break;

ERROR:SWITCH_CASE_INDENT_LEVEL: switch and case should be at the same indent
#53229: FILE: arch/ia64/kernel/unaligned.c:1447:
+	switch (opcode) {
+	      case LDS_OP:
+	      case LDSA_OP:
[...]
+	      case LDS_IMM_OP:
+	      case LDSA_IMM_OP:
+	      case LDFS_OP:
+	      case LDFSA_OP:
+	      case LDFS_IMM_OP:
[...]
+	      case LD_OP:
+	      case LDA_OP:
+	      case LDBIAS_OP:
+	      case LDACQ_OP:
+	      case LDCCLR_OP:
+	      case LDCNC_OP:
+	      case LDCCLRACQ_OP:
[...]
+	      case LD_IMM_OP:
+	      case LDA_IMM_OP:
+	      case LDBIAS_IMM_OP:
+	      case LDACQ_IMM_OP:
+	      case LDCCLR_IMM_OP:
+	      case LDCNC_IMM_OP:
+	      case LDCCLRACQ_IMM_OP:
[...]
+	      case ST_OP:
+	      case STREL_OP:
[...]
+	      case ST_IMM_OP:
+	      case STREL_IMM_OP:
[...]
+	      case LDF_OP:
+	      case LDFA_OP:
+	      case LDFCCLR_OP:
+	      case LDFCNC_OP:
[...]
+	      case LDF_IMM_OP:
+	      case LDFA_IMM_OP:
+	      case LDFCCLR_IMM_OP:
+	      case LDFCNC_IMM_OP:
[...]
+	      case STF_OP:
+	      case STF_IMM_OP:
[...]
+	      default:

ERROR:SWITCH_CASE_INDENT_LEVEL: switch and case should be at the same indent
#53935: FILE: arch/ia64/kernel/unwind.c:308:
+				switch (ireg->nat.type) {
+				      case UNW_NAT_VAL:
[...]
+				      case UNW_NAT_NONE:
[...]
+				      case UNW_NAT_MEMSTK:
[...]
+				      case UNW_NAT_REGSTK:

ERROR:SWITCH_CASE_INDENT_LEVEL: switch and case should be at the same indent
#54042: FILE: arch/ia64/kernel/unwind.c:415:
+	switch (regnum) {
[...]
+	      case 0: pt = get_scratch_regs(info); addr = &pt->b0; break;
+	      case 6: pt = get_scratch_regs(info); addr = &pt->b6; break;
+	      case 7: pt = get_scratch_regs(info); addr = &pt->b7; break;
[...]
+	      case 1: case 2: case 3: case 4: case 5:
[...]
+	      default:

ERROR:SWITCH_CASE_INDENT_LEVEL: switch and case should be at the same indent
#54127: FILE: arch/ia64/kernel/unwind.c:500:
+	switch (regnum) {
+	      case UNW_AR_BSP:
[...]
+	      case UNW_AR_BSPSTORE:
[...]
+	      case UNW_AR_PFS:
[...]
+	      case UNW_AR_RNAT:
[...]
+	      case UNW_AR_UNAT:
[...]
+	      case UNW_AR_LC:
[...]
+	      case UNW_AR_EC:
[...]
+	      case UNW_AR_FPSR:
[...]
+	      case UNW_AR_RSC:
[...]
+	      case UNW_AR_CCV:
[...]
+	      case UNW_AR_CSD:
[...]
+	      case UNW_AR_SSD:
[...]
+	      default:

ERROR:SWITCH_CASE_INDENT_LEVEL: switch and case should be at the same indent
#54310: FILE: arch/ia64/kernel/unwind.c:683:
+	switch (abreg) {
+	      case 0x04 ... 0x07: return UNW_REG_R4 + (abreg - 0x04);
+	      case 0x22 ... 0x25: return UNW_REG_F2 + (abreg - 0x22);
+	      case 0x30 ... 0x3f: return UNW_REG_F16 + (abreg - 0x30);
+	      case 0x41 ... 0x45: return UNW_REG_B1 + (abreg - 0x41);
+	      case 0x60: return UNW_REG_PR;
+	      case 0x61: return UNW_REG_PSP;
+	      case 0x62: return memory ? UNW_REG_PRI_UNAT_MEM : UNW_REG_PRI_UNAT_GR;
+	      case 0x63: return UNW_REG_RP;
+	      case 0x64: return UNW_REG_BSP;
+	      case 0x65: return UNW_REG_BSPSTORE;
+	      case 0x66: return UNW_REG_RNAT;
+	      case 0x67: return UNW_REG_UNAT;
+	      case 0x68: return UNW_REG_FPSR;
+	      case 0x69: return UNW_REG_PFS;
+	      case 0x6a: return UNW_REG_LC;
+	      default:

ERROR:SWITCH_CASE_INDENT_LEVEL: switch and case should be at the same indent
#54991: FILE: arch/ia64/kernel/unwind.c:1364:
+	switch (r->where) {
+	      case UNW_WHERE_GR:
[...]
+	      case UNW_WHERE_FR:
[...]
+	      case UNW_WHERE_BR:
[...]
+	      case UNW_WHERE_PSPREL:
+	      case UNW_WHERE_SPREL:
[...]
+	      default:

ERROR:SWITCH_CASE_INDENT_LEVEL: switch and case should be at the same indent
#55044: FILE: arch/ia64/kernel/unwind.c:1417:
+	switch (r->where) {
+	      case UNW_WHERE_GR:
[...]
+	      case UNW_WHERE_FR:
[...]
+	      case UNW_WHERE_BR:
[...]
+	      case UNW_WHERE_SPREL:
[...]
+	      case UNW_WHERE_PSPREL:
[...]
+	      default:

ERROR:SWITCH_CASE_INDENT_LEVEL: switch and case should be at the same indent
#55273: FILE: arch/ia64/kernel/unwind.c:1646:
+			switch (r->where) {
+			      case UNW_WHERE_GR:     UNW_DPRINT(1, "r%lu", r->val); break;
+			      case UNW_WHERE_FR:     UNW_DPRINT(1, "f%lu", r->val); break;
+			      case UNW_WHERE_BR:     UNW_DPRINT(1, "b%lu", r->val); break;
+			      case UNW_WHERE_SPREL:  UNW_DPRINT(1, "[sp+0x%lx]", r->val); break;
+			      case UNW_WHERE_PSPREL: UNW_DPRINT(1, "[psp+0x%lx]", r->val); break;
+			      case UNW_WHERE_NONE:
[...]
+			      default:

ERROR:SWITCH_CASE_INDENT_LEVEL: switch and case should be at the same indent
#55367: FILE: arch/ia64/kernel/unwind.c:1740:
+		switch (opc) {
+		      case UNW_INSN_ADD:
[...]
+		      case UNW_INSN_MOVE2:
[...]
+		      case UNW_INSN_MOVE:
[...]
+		      case UNW_INSN_MOVE_SCRATCH:
[...]
+		      case UNW_INSN_MOVE_CONST:
[...]
+		      case UNW_INSN_MOVE_STACKED:
[...]
+		      case UNW_INSN_ADD_PSP:
[...]
+		      case UNW_INSN_ADD_SP:
[...]
+		      case UNW_INSN_SETNAT_MEMSTK:
[...]
+		      case UNW_INSN_SETNAT_TYPE:
[...]
+		      case UNW_INSN_LOAD:

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#58240: FILE: arch/ia64/lib/csum_partial_copy.c:35:
+unsigned long do_csum_c(const unsigned char * buff, int len, unsigned int psum)

WARNING:REPEATED_WORD: Possible repeated word: 'by'
#60720: FILE: arch/ia64/lib/strncpy_from_user.S:17:
+ * 00/03/06 D. Mosberger Fixed to return proper return value (bug found by
+ *			 by Andreas Schwab <schwab@suse.de>).

ERROR:SWITCH_CASE_INDENT_LEVEL: switch and case should be at the same indent
#64936: FILE: drivers/char/agp/hp-agp.c:87:
+	switch (hp->io_tlb_ps) {
+		case 0: hp->io_tlb_shift = 12; break;
+		case 1: hp->io_tlb_shift = 13; break;
+		case 2: hp->io_tlb_shift = 14; break;
+		case 3: hp->io_tlb_shift = 16; break;
+		default:

ERROR:RETURN_PARENTHESES: return is not a function, parentheses are not required
#66796: FILE: drivers/cpufreq/ia64-acpi-cpufreq.c:293:
+	return (result);

ERROR:RETURN_PARENTHESES: return is not a function, parentheses are not required
#66804: FILE: drivers/cpufreq/ia64-acpi-cpufreq.c:301:
+	return (result);

ERROR:SWITCH_CASE_INDENT_LEVEL: switch and case should be at the same indent
#67016: FILE: drivers/firmware/pcdp.c:33:
+			switch (uart->parity) {
+			    case 0x2: parity = 'e'; break;
+			    case 0x3: parity = 'o'; break;
+			    default:  parity = 'n';

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
