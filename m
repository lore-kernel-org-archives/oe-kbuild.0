Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01DED7F
	for <oe-kbuild@lists.linux.dev>; Mon,  7 Nov 2022 17:07:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1667840832; x=1699376832;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=nxw3yFwD8CcVd2MWg6i4tKb3WZM0IBjNWXSAtzE0quI=;
  b=QXEXjTK3ATbcLbR6lR9jgrYkyZrm9GhIB+hTbjPAkPCVgtgyArlTU4Uj
   8i+SORz9cKwdGcK6I6Okr6+Eep1UBVH9esc9Y7xpw5qsnAfYOmxyh3lJS
   XTzotO28dnwg1OIb0Vgai7a/KjRIN53V3JgAzRhXzZmC4d6xMY6O1MglX
   vRYSeoqFgE56TRTPtpIIjelxH0oS+Ne/uvv/VB/shNcqviNVLBgl96Y9x
   yLpxDNnLNqW5pK7oiogwRCH0GYbpniBcxI4CqTMpK9Gbzim/dEYETviNE
   6pMFR33DVwYa931YcUcd18VmPyeWzTiSlTTJKSKrLA3OF2lIU3Vu2D2M+
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10524"; a="297966001"
X-IronPort-AV: E=Sophos;i="5.96,145,1665471600"; 
   d="scan'208";a="297966001"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2022 09:00:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10524"; a="965224630"
X-IronPort-AV: E=Sophos;i="5.96,145,1665471600"; 
   d="scan'208";a="965224630"
Received: from lkp-server01.sh.intel.com (HELO 462403710aa9) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 07 Nov 2022 09:00:55 -0800
Received: from kbuild by 462403710aa9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1os5UU-0000q8-1P;
	Mon, 07 Nov 2022 17:00:54 +0000
Date: Tue, 8 Nov 2022 01:00:22 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [avpatel:riscv_sbi_dbcn_v1 24/36] arch/riscv/kvm/aia.c:31:43:
 warning: Parameter 'owner' can be declared as pointer to const
 [constParameter]
Message-ID: <202211080014.MHPrgml8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: arch/riscv/kvm/aia.c:31:43: warning: Parameter 'owner' can be declared as pointer to const [constParameter]"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Anup Patel <apatel@ventanamicro.com>

tree:   https://github.com/avpatel/linux.git riscv_sbi_dbcn_v1
head:   640c4126b855fd927f554cd45b172effa6d6f3b9
commit: 325cd39ca129e58e5ced2ee7c19375d52e2d622f [24/36] RISC-V: KVM: Implement guest external interrupt line management
:::::: branch date: 9 hours ago
:::::: commit date: 3 weeks ago
compiler: riscv64-linux-gcc (GCC) 12.1.0
reproduce (cppcheck warning):
        # apt-get install cppcheck
        git checkout 325cd39ca129e58e5ced2ee7c19375d52e2d622f
        cppcheck --quiet --enable=style,performance,portability --template=gcc FILE

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> arch/riscv/kvm/aia.c:31:43: warning: Parameter 'owner' can be declared as pointer to const [constParameter]
   static int aia_find_hgei(struct kvm_vcpu *owner)
                                             ^
--
>> arch/riscv/kvm/vcpu_insn.c:612:9: warning: Expression '-(20-2)' can have a negative value. That is converted to an unsigned value and used in an unsigned calculation. [signConversion]
    data = GET_RS2(insn, &vcpu->arch.guest_context);
           ^
   arch/riscv/kvm/vcpu_insn.c:636:12: warning: Expression '0-2' can have a negative value. That is converted to an unsigned value and used in an unsigned calculation. [signConversion]
     data32 = GET_RS2S(insn, &vcpu->arch.guest_context);
              ^
   arch/riscv/kvm/vcpu_insn.c:612:9: warning: Expression '-(20-3)' can have a negative value. That is converted to an unsigned value and used in an unsigned calculation. [signConversion]
    data = GET_RS2(insn, &vcpu->arch.guest_context);
           ^
   arch/riscv/kvm/vcpu_insn.c:628:12: warning: Expression '0-3' can have a negative value. That is converted to an unsigned value and used in an unsigned calculation. [signConversion]
     data64 = GET_RS2S(insn, &vcpu->arch.guest_context);
              ^
   arch/riscv/kvm/vcpu_insn.c:632:12: warning: Expression '2-3' can have a negative value. That is converted to an unsigned value and used in an unsigned calculation. [signConversion]
     data64 = GET_RS2C(insn, &vcpu->arch.guest_context);
              ^
   arch/riscv/kvm/vcpu_insn.c:636:12: warning: Expression '0-3' can have a negative value. That is converted to an unsigned value and used in an unsigned calculation. [signConversion]
     data32 = GET_RS2S(insn, &vcpu->arch.guest_context);
              ^
   arch/riscv/kvm/vcpu_insn.c:640:12: warning: Expression '2-3' can have a negative value. That is converted to an unsigned value and used in an unsigned calculation. [signConversion]
     data32 = GET_RS2C(insn, &vcpu->arch.guest_context);
              ^

vim +/owner +31 arch/riscv/kvm/aia.c

10a16774bdaeea Anup Patel 2022-01-19  30  
325cd39ca129e5 Anup Patel 2022-01-19 @31  static int aia_find_hgei(struct kvm_vcpu *owner)
325cd39ca129e5 Anup Patel 2022-01-19  32  {
325cd39ca129e5 Anup Patel 2022-01-19  33  	int i, hgei;
325cd39ca129e5 Anup Patel 2022-01-19  34  	unsigned long flags;
325cd39ca129e5 Anup Patel 2022-01-19  35  	struct aia_hgei_control *hgctrl = this_cpu_ptr(&aia_hgei);
325cd39ca129e5 Anup Patel 2022-01-19  36  
325cd39ca129e5 Anup Patel 2022-01-19  37  	raw_spin_lock_irqsave(&hgctrl->lock, flags);
325cd39ca129e5 Anup Patel 2022-01-19  38  
325cd39ca129e5 Anup Patel 2022-01-19  39  	hgei = -1;
325cd39ca129e5 Anup Patel 2022-01-19  40  	for (i = 1; i <= kvm_riscv_aia_nr_hgei; i++) {
325cd39ca129e5 Anup Patel 2022-01-19  41  		if (hgctrl->owners[i] == owner) {
325cd39ca129e5 Anup Patel 2022-01-19  42  			hgei = i;
325cd39ca129e5 Anup Patel 2022-01-19  43  			break;
325cd39ca129e5 Anup Patel 2022-01-19  44  		}
325cd39ca129e5 Anup Patel 2022-01-19  45  	}
325cd39ca129e5 Anup Patel 2022-01-19  46  
325cd39ca129e5 Anup Patel 2022-01-19  47  	raw_spin_unlock_irqrestore(&hgctrl->lock, flags);
325cd39ca129e5 Anup Patel 2022-01-19  48  
325cd39ca129e5 Anup Patel 2022-01-19  49  	return hgei;
325cd39ca129e5 Anup Patel 2022-01-19  50  }
325cd39ca129e5 Anup Patel 2022-01-19  51  

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
