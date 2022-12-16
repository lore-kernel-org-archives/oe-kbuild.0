Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 124BE8BEE
	for <oe-kbuild@lists.linux.dev>; Fri, 16 Dec 2022 21:46:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1671227208; x=1702763208;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Oo3pIP0ZYfTRCI8hFhNQS5Qz8uvyFULIu61lU/wbJvQ=;
  b=FR6dgA/vcYhIDP6OBZ6muC9ifB3bIL+HF4utQjmJZoMJ1qjWl7CVVqX2
   1QZr/MQZbQZifHDmgm6ghoVxF7gd3F048Zd/bzjdTNglqiigX0df6QpD+
   Bx3hX8d86XU7yOiG/TlhzWiAXZ40V8Jem1cxf4Ym+rHl5/Ifi0sVZ0383
   577CMi0EM+6rYkw00b67JoTaPcPGzG5h75vTVXuYbzGc5gzxIPy3tIblf
   bLxgZdySMd3knQ7y84eVbCWwTSLhXToq7aH++YpvNjOwoY3S+45YRF1GQ
   sLisLctiCPF1/28xTbrSA6+rce+v1Za6eh1goKb4OLSmV7qHOU30oNvd5
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10563"; a="320237059"
X-IronPort-AV: E=Sophos;i="5.96,251,1665471600"; 
   d="scan'208";a="320237059"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Dec 2022 13:46:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10563"; a="774286229"
X-IronPort-AV: E=Sophos;i="5.96,251,1665471600"; 
   d="scan'208";a="774286229"
Received: from lkp-server01.sh.intel.com (HELO b5d47979f3ad) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 16 Dec 2022 13:46:42 -0800
Received: from kbuild by b5d47979f3ad with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1p6IXR-0007QE-2O;
	Fri, 16 Dec 2022 21:46:41 +0000
Date: Sat, 17 Dec 2022 05:45:47 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/powerpc/lib/sstep.c:1635:9: warning: Shifting a negative value
 is technically undefined behaviour [shiftNegativeLHS]
Message-ID: <202212170524.5mGjWH9c-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: arch/powerpc/lib/sstep.c:1635:9: warning: Shifting a negative value is technically undefined behaviour [shiftNegativeLHS]"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Anders Roxell <anders.roxell@linaro.org>
CC: Michael Ellerman <mpe@ellerman.id.au>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   dcde56bb37a9f900c11eec56b0ecaca5653cc829
commit: fe663df7825811358531dc2e8a52d9eaa5e3515e powerpc/lib/sstep: fix 'ptesync' build error
date:   10 months ago
:::::: branch date: 3 hours ago
:::::: commit date: 10 months ago
compiler: powerpc-linux-gcc (GCC) 12.1.0
reproduce (cppcheck warning):
        # apt-get install cppcheck
        git checkout fe663df7825811358531dc2e8a52d9eaa5e3515e
        cppcheck --quiet --enable=style,performance,portability --template=gcc FILE

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> arch/powerpc/sysdev/mpic_msgr.c:117:4: warning: %d in format string (no. 1) requires 'int' but the argument type is 'unsigned int'. [invalidPrintfArgType_sint]
      snprintf(buf, sizeof(buf), "mpic-msgr-block%d", count);
      ^
   arch/powerpc/sysdev/mpic_msgr.c:147:3: warning: %d in format string (no. 1) requires 'int' but the argument type is 'unsigned int'. [invalidPrintfArgType_sint]
     snprintf(buf, sizeof(buf), "mpic-msgr-block%d", index);
     ^
   arch/powerpc/sysdev/mpic_msgr.c:133:55: warning: Parameter 'node' can be declared as pointer to const [constParameter]
   static int mpic_msgr_block_number(struct device_node *node)
                                                         ^
--
>> arch/powerpc/platforms/powermac/setup.c:595:2: warning: Found a exit path from function with non-void return type that has missing return statement [missingReturn]
    .name   = "PowerMac",
    ^
--
>> arch/powerpc/lib/sstep.c:1635:9: warning: Shifting a negative value is technically undefined behaviour [shiftNegativeLHS]
     imm = MASK32(mb, me);
           ^
   arch/powerpc/lib/sstep.c:1643:31: warning: Shifting a negative value is technically undefined behaviour [shiftNegativeLHS]
     op->val = ROTATE(val, rb) & MASK32(mb, me);
                                 ^
   arch/powerpc/lib/sstep.c:1651:31: warning: Shifting a negative value is technically undefined behaviour [shiftNegativeLHS]
     op->val = ROTATE(val, rb) & MASK32(mb, me);
                                 ^
>> arch/powerpc/lib/sstep.c:329:1: warning: Label 'Efault' is not used. There is #if in function body so the label might be used in code that is removed by the preprocessor. [unusedLabelConfiguration]
   Efault:
   ^
   arch/powerpc/lib/sstep.c:386:1: warning: Label 'Efault' is not used. There is #if in function body so the label might be used in code that is removed by the preprocessor. [unusedLabelConfiguration]
   Efault:
   ^
   arch/powerpc/lib/sstep.c:465:1: warning: Label 'Efault' is not used. There is #if in function body so the label might be used in code that is removed by the preprocessor. [unusedLabelConfiguration]
   Efault:
   ^
   arch/powerpc/lib/sstep.c:522:1: warning: Label 'Efault' is not used. There is #if in function body so the label might be used in code that is removed by the preprocessor. [unusedLabelConfiguration]
   Efault:
   ^
>> arch/powerpc/lib/sstep.c:656:8: warning: Overlapping read/write of union is undefined behavior [overlappingWriteUnion]
      u.u = u.l[0];
          ^
>> arch/powerpc/lib/sstep.c:2232:33: warning: Unsigned expression '63-sh' can't be negative so it is unnecessary to test it. [unsignedPositive]
       op->val = ROTATE(val, sh) & MASK64(0, 63 - sh);
                                   ^
>> arch/powerpc/lib/sstep.c:2201:19: warning: Shifting signed 64-bit value by 63 bits is implementation-defined behaviour [shiftTooManyBitsSigned]
      op->val = ival >> (sh < 64 ? sh : 63);
                     ^

vim +1635 arch/powerpc/lib/sstep.c

930d6288a26787d Sandipan Das               2019-02-22  1563  
0016a4cf5582415 Paul Mackerras             2010-06-15  1564  	case 7:		/* mulli */
777e26f0edf8dab Jordan Niethe              2020-05-06  1565  		op->val = regs->gpr[ra] * (short) word;
3cdfcbfd32b9d1c Paul Mackerras             2017-08-30  1566  		goto compute_done;
0016a4cf5582415 Paul Mackerras             2010-06-15  1567  
0016a4cf5582415 Paul Mackerras             2010-06-15  1568  	case 8:		/* subfic */
777e26f0edf8dab Jordan Niethe              2020-05-06  1569  		imm = (short) word;
3cdfcbfd32b9d1c Paul Mackerras             2017-08-30  1570  		add_with_carry(regs, op, rd, ~regs->gpr[ra], imm, 1);
3cdfcbfd32b9d1c Paul Mackerras             2017-08-30  1571  		return 1;
0016a4cf5582415 Paul Mackerras             2010-06-15  1572  
0016a4cf5582415 Paul Mackerras             2010-06-15  1573  	case 10:	/* cmpli */
777e26f0edf8dab Jordan Niethe              2020-05-06  1574  		imm = (unsigned short) word;
0016a4cf5582415 Paul Mackerras             2010-06-15  1575  		val = regs->gpr[ra];
0016a4cf5582415 Paul Mackerras             2010-06-15  1576  #ifdef __powerpc64__
0016a4cf5582415 Paul Mackerras             2010-06-15  1577  		if ((rd & 1) == 0)
0016a4cf5582415 Paul Mackerras             2010-06-15  1578  			val = (unsigned int) val;
0016a4cf5582415 Paul Mackerras             2010-06-15  1579  #endif
3cdfcbfd32b9d1c Paul Mackerras             2017-08-30  1580  		do_cmp_unsigned(regs, op, val, imm, rd >> 2);
3cdfcbfd32b9d1c Paul Mackerras             2017-08-30  1581  		return 1;
0016a4cf5582415 Paul Mackerras             2010-06-15  1582  
0016a4cf5582415 Paul Mackerras             2010-06-15  1583  	case 11:	/* cmpi */
777e26f0edf8dab Jordan Niethe              2020-05-06  1584  		imm = (short) word;
0016a4cf5582415 Paul Mackerras             2010-06-15  1585  		val = regs->gpr[ra];
0016a4cf5582415 Paul Mackerras             2010-06-15  1586  #ifdef __powerpc64__
0016a4cf5582415 Paul Mackerras             2010-06-15  1587  		if ((rd & 1) == 0)
0016a4cf5582415 Paul Mackerras             2010-06-15  1588  			val = (int) val;
0016a4cf5582415 Paul Mackerras             2010-06-15  1589  #endif
3cdfcbfd32b9d1c Paul Mackerras             2017-08-30  1590  		do_cmp_signed(regs, op, val, imm, rd >> 2);
3cdfcbfd32b9d1c Paul Mackerras             2017-08-30  1591  		return 1;
0016a4cf5582415 Paul Mackerras             2010-06-15  1592  
0016a4cf5582415 Paul Mackerras             2010-06-15  1593  	case 12:	/* addic */
777e26f0edf8dab Jordan Niethe              2020-05-06  1594  		imm = (short) word;
3cdfcbfd32b9d1c Paul Mackerras             2017-08-30  1595  		add_with_carry(regs, op, rd, regs->gpr[ra], imm, 0);
3cdfcbfd32b9d1c Paul Mackerras             2017-08-30  1596  		return 1;
0016a4cf5582415 Paul Mackerras             2010-06-15  1597  
0016a4cf5582415 Paul Mackerras             2010-06-15  1598  	case 13:	/* addic. */
777e26f0edf8dab Jordan Niethe              2020-05-06  1599  		imm = (short) word;
3cdfcbfd32b9d1c Paul Mackerras             2017-08-30  1600  		add_with_carry(regs, op, rd, regs->gpr[ra], imm, 0);
ad47ff3e33503e0 Anton Blanchard            2017-09-19  1601  		set_cr0(regs, op);
3cdfcbfd32b9d1c Paul Mackerras             2017-08-30  1602  		return 1;
0016a4cf5582415 Paul Mackerras             2010-06-15  1603  
0016a4cf5582415 Paul Mackerras             2010-06-15  1604  	case 14:	/* addi */
777e26f0edf8dab Jordan Niethe              2020-05-06  1605  		imm = (short) word;
0016a4cf5582415 Paul Mackerras             2010-06-15  1606  		if (ra)
0016a4cf5582415 Paul Mackerras             2010-06-15  1607  			imm += regs->gpr[ra];
3cdfcbfd32b9d1c Paul Mackerras             2017-08-30  1608  		op->val = imm;
3cdfcbfd32b9d1c Paul Mackerras             2017-08-30  1609  		goto compute_done;
0016a4cf5582415 Paul Mackerras             2010-06-15  1610  
0016a4cf5582415 Paul Mackerras             2010-06-15  1611  	case 15:	/* addis */
777e26f0edf8dab Jordan Niethe              2020-05-06  1612  		imm = ((short) word) << 16;
0016a4cf5582415 Paul Mackerras             2010-06-15  1613  		if (ra)
0016a4cf5582415 Paul Mackerras             2010-06-15  1614  			imm += regs->gpr[ra];
3cdfcbfd32b9d1c Paul Mackerras             2017-08-30  1615  		op->val = imm;
3cdfcbfd32b9d1c Paul Mackerras             2017-08-30  1616  		goto compute_done;
0016a4cf5582415 Paul Mackerras             2010-06-15  1617  
958465ee5407dc1 Paul Mackerras             2017-08-30  1618  	case 19:
777e26f0edf8dab Jordan Niethe              2020-05-06  1619  		if (((word >> 1) & 0x1f) == 2) {
958465ee5407dc1 Paul Mackerras             2017-08-30  1620  			/* addpcis */
8813ff49607eab3 Ananth N Mavinakayanahalli 2021-01-25  1621  			if (!cpu_has_feature(CPU_FTR_ARCH_300))
8813ff49607eab3 Ananth N Mavinakayanahalli 2021-01-25  1622  				goto unknown_opcode;
777e26f0edf8dab Jordan Niethe              2020-05-06  1623  			imm = (short) (word & 0xffc1);	/* d0 + d2 fields */
777e26f0edf8dab Jordan Niethe              2020-05-06  1624  			imm |= (word >> 15) & 0x3e;	/* d1 field */
958465ee5407dc1 Paul Mackerras             2017-08-30  1625  			op->val = regs->nip + (imm << 16) + 4;
958465ee5407dc1 Paul Mackerras             2017-08-30  1626  			goto compute_done;
958465ee5407dc1 Paul Mackerras             2017-08-30  1627  		}
958465ee5407dc1 Paul Mackerras             2017-08-30  1628  		op->type = UNKNOWN;
958465ee5407dc1 Paul Mackerras             2017-08-30  1629  		return 0;
958465ee5407dc1 Paul Mackerras             2017-08-30  1630  
0016a4cf5582415 Paul Mackerras             2010-06-15  1631  	case 20:	/* rlwimi */
777e26f0edf8dab Jordan Niethe              2020-05-06  1632  		mb = (word >> 6) & 0x1f;
777e26f0edf8dab Jordan Niethe              2020-05-06  1633  		me = (word >> 1) & 0x1f;
0016a4cf5582415 Paul Mackerras             2010-06-15  1634  		val = DATA32(regs->gpr[rd]);
0016a4cf5582415 Paul Mackerras             2010-06-15 @1635  		imm = MASK32(mb, me);
3cdfcbfd32b9d1c Paul Mackerras             2017-08-30  1636  		op->val = (regs->gpr[ra] & ~imm) | (ROTATE(val, rb) & imm);
0016a4cf5582415 Paul Mackerras             2010-06-15  1637  		goto logical_done;
0016a4cf5582415 Paul Mackerras             2010-06-15  1638  
0016a4cf5582415 Paul Mackerras             2010-06-15  1639  	case 21:	/* rlwinm */
777e26f0edf8dab Jordan Niethe              2020-05-06  1640  		mb = (word >> 6) & 0x1f;
777e26f0edf8dab Jordan Niethe              2020-05-06  1641  		me = (word >> 1) & 0x1f;
0016a4cf5582415 Paul Mackerras             2010-06-15  1642  		val = DATA32(regs->gpr[rd]);
3cdfcbfd32b9d1c Paul Mackerras             2017-08-30  1643  		op->val = ROTATE(val, rb) & MASK32(mb, me);
0016a4cf5582415 Paul Mackerras             2010-06-15  1644  		goto logical_done;
0016a4cf5582415 Paul Mackerras             2010-06-15  1645  
0016a4cf5582415 Paul Mackerras             2010-06-15  1646  	case 23:	/* rlwnm */
777e26f0edf8dab Jordan Niethe              2020-05-06  1647  		mb = (word >> 6) & 0x1f;
777e26f0edf8dab Jordan Niethe              2020-05-06  1648  		me = (word >> 1) & 0x1f;
0016a4cf5582415 Paul Mackerras             2010-06-15  1649  		rb = regs->gpr[rb] & 0x1f;
0016a4cf5582415 Paul Mackerras             2010-06-15  1650  		val = DATA32(regs->gpr[rd]);
3cdfcbfd32b9d1c Paul Mackerras             2017-08-30  1651  		op->val = ROTATE(val, rb) & MASK32(mb, me);
0016a4cf5582415 Paul Mackerras             2010-06-15  1652  		goto logical_done;
0016a4cf5582415 Paul Mackerras             2010-06-15  1653  
0016a4cf5582415 Paul Mackerras             2010-06-15  1654  	case 24:	/* ori */
777e26f0edf8dab Jordan Niethe              2020-05-06  1655  		op->val = regs->gpr[rd] | (unsigned short) word;
3cdfcbfd32b9d1c Paul Mackerras             2017-08-30  1656  		goto logical_done_nocc;
0016a4cf5582415 Paul Mackerras             2010-06-15  1657  
0016a4cf5582415 Paul Mackerras             2010-06-15  1658  	case 25:	/* oris */
777e26f0edf8dab Jordan Niethe              2020-05-06  1659  		imm = (unsigned short) word;
3cdfcbfd32b9d1c Paul Mackerras             2017-08-30  1660  		op->val = regs->gpr[rd] | (imm << 16);
3cdfcbfd32b9d1c Paul Mackerras             2017-08-30  1661  		goto logical_done_nocc;
0016a4cf5582415 Paul Mackerras             2010-06-15  1662  
0016a4cf5582415 Paul Mackerras             2010-06-15  1663  	case 26:	/* xori */
777e26f0edf8dab Jordan Niethe              2020-05-06  1664  		op->val = regs->gpr[rd] ^ (unsigned short) word;
3cdfcbfd32b9d1c Paul Mackerras             2017-08-30  1665  		goto logical_done_nocc;
0016a4cf5582415 Paul Mackerras             2010-06-15  1666  
0016a4cf5582415 Paul Mackerras             2010-06-15  1667  	case 27:	/* xoris */
777e26f0edf8dab Jordan Niethe              2020-05-06  1668  		imm = (unsigned short) word;
3cdfcbfd32b9d1c Paul Mackerras             2017-08-30  1669  		op->val = regs->gpr[rd] ^ (imm << 16);
3cdfcbfd32b9d1c Paul Mackerras             2017-08-30  1670  		goto logical_done_nocc;
0016a4cf5582415 Paul Mackerras             2010-06-15  1671  
0016a4cf5582415 Paul Mackerras             2010-06-15  1672  	case 28:	/* andi. */
777e26f0edf8dab Jordan Niethe              2020-05-06  1673  		op->val = regs->gpr[rd] & (unsigned short) word;
ad47ff3e33503e0 Anton Blanchard            2017-09-19  1674  		set_cr0(regs, op);
3cdfcbfd32b9d1c Paul Mackerras             2017-08-30  1675  		goto logical_done_nocc;
0016a4cf5582415 Paul Mackerras             2010-06-15  1676  
0016a4cf5582415 Paul Mackerras             2010-06-15  1677  	case 29:	/* andis. */
777e26f0edf8dab Jordan Niethe              2020-05-06  1678  		imm = (unsigned short) word;
3cdfcbfd32b9d1c Paul Mackerras             2017-08-30  1679  		op->val = regs->gpr[rd] & (imm << 16);
ad47ff3e33503e0 Anton Blanchard            2017-09-19  1680  		set_cr0(regs, op);
3cdfcbfd32b9d1c Paul Mackerras             2017-08-30  1681  		goto logical_done_nocc;
0016a4cf5582415 Paul Mackerras             2010-06-15  1682  

:::::: The code at line 1635 was first introduced by commit
:::::: 0016a4cf5582415849fafbf9f019dd9530824789 powerpc: Emulate most Book I instructions in emulate_step()

:::::: TO: Paul Mackerras <paulus@samba.org>
:::::: CC: Paul Mackerras <paulus@samba.org>

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
