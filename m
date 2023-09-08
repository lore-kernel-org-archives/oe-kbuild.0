Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 486CE5254
	for <oe-kbuild@lists.linux.dev>; Fri,  8 Sep 2023 12:59:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694177968; x=1725713968;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=j6LrN9S2mHYnRk2/YPHYeEy3Nvf6ywhQdphF9dTAg4A=;
  b=CtE4GdO4QRosZKl7XFNMTDSUb55MXuisMToDjWrZilhXZjftc2oDl8TI
   nyLeQr7LIQ5RhDL+sgeBMe4TTE//YQme97WU3L/iUZRTyP9oykyHGYurm
   BYhJksVIYHg28wpvgPzP1MsENaJSTiQyHIyInQe0nTzJkbuqEySFZReMc
   nDCBFxqg+k9eqNu94NGOkb2eP4ST2vZOxyh8scRx9VSbEyQk9DDDlR+Kl
   a+6bzaH0sG3+4GE20IrW8U8pSBN07boLEfSU5Kxml4QMMqP20CipWPz5L
   TBEYYEj5gDHQEZgsiYHLQ08SoEiUThhXTqs7b+neva6u/zo7gB8UwD6LH
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10827"; a="367900536"
X-IronPort-AV: E=Sophos;i="6.02,237,1688454000"; 
   d="scan'208";a="367900536"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2023 05:59:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10827"; a="989245442"
X-IronPort-AV: E=Sophos;i="6.02,237,1688454000"; 
   d="scan'208";a="989245442"
Received: from lkp-server01.sh.intel.com (HELO 59b3c6e06877) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 08 Sep 2023 05:59:07 -0700
Received: from kbuild by 59b3c6e06877 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qeb4j-0002Gz-0A;
	Fri, 08 Sep 2023 12:59:05 +0000
Date: Fri, 8 Sep 2023 20:58:55 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [oracle-dtrace:v2/6.5 1/13] builtin:4:927: sparse: sparse: string
 too long (9998 bytes, 8191 bytes max)
Message-ID: <202309082032.YStUB4P6-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

::::::=20
:::::: Manual check reason: "low confidence static check first_new_problem:=
 builtin:4:927: sparse: sparse: string too long (9998 bytes, 8191 bytes max=
)"
::::::=20

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Luis Chamberlain <mcgrof@kernel.org>
CC: Nick Alcock <nick.alcock@oracle.com>

tree:   https://github.com/oracle/dtrace-linux-kernel v2/6.5
head:   1120d1c598d4ae2d08278969b9001a866aa8273a
commit: acb632160f89e4c8caaaa6b8c6a94f13d06cadb5 [1/13] kbuild: add modules=
=2Ebuiltin.objs
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: x86_64-randconfig-123-20230908 (https://download.01.org/0day-ci/arc=
hive/20230908/202309082032.YStUB4P6-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20230908/202309082032.YStUB4P6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202309082032.YStUB4P6-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   command-line: note: in included file:
   builtin:2:0: sparse: sparse: missing terminating " character
   builtin:3:0: sparse: sparse: missing terminating " character
>> builtin:4:927: sparse: sparse: string too long (9998 bytes, 8191 bytes m=
ax)
   builtin:2:1: sparse: sparse: Expected ; at the end of type declaration
   builtin:2:1: sparse: sparse: got
   builtin:2:337: sparse: sparse: Expected ; at the end of type declaration
   builtin:2:337: sparse: sparse: got =1F
   builtin:2:609: sparse: sparse: Expected ; at the end of type declaration
   builtin:2:609: sparse: sparse: got $
   command-line: note: in included file (through builtin):
   include/linux/compiler_types.h:157:1: sparse: sparse: Expected ; at the =
end of type declaration
   include/linux/compiler_types.h:157:1: sparse: sparse: got }
   include/linux/compiler_types.h:144:20: sparse: sparse: symbol 'file' was=
 not declared. Should it be static?
   drivers/gpu/drm/amd/amdgpu/amdgpu_atomfirmware.c: note: in included file=
 (through drivers/gpu/drm/amd/amdgpu/amdgpu_virt.h, drivers/gpu/drm/amd/amd=
gpu/amdgpu.h):
   drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h:315:49: sparse: sparse: stat=
ic assertion failed: "amd_sriov_msg_vf2pf_info must be 1 KB"
   drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h:319:49: sparse: sparse: stat=
ic assertion failed: "amd_sriov_msg_pf2vf_info must be 1 KB"
--
   command-line: note: in included file:
   builtin:2:0: sparse: sparse: missing terminating " character
   builtin:6:0: sparse: sparse: missing terminating " character
   builtin:7:0: sparse: sparse: missing terminating ' character
   builtin:9:0: sparse: sparse: missing terminating " character
   builtin:10:1000: sparse: sparse: End of file in middle of string
   builtin:2:1: sparse: sparse: Expected ; at the end of type declaration
   builtin:2:1: sparse: sparse: got ~
   builtin:8:257: sparse: sparse: Expected ; at the end of type declaration
   builtin:8:257: sparse: sparse: got =8C
>> builtin:8:836: sparse: sparse: expression expected before '=FF'
   builtin:8:836: sparse: sparse: Expected ; at end of declaration
   builtin:8:836: sparse: sparse: got =FF
   builtin:8:844: sparse: sparse: expression expected before '=FF'
   builtin:8:844: sparse: sparse: Expected ; at end of declaration
   builtin:8:844: sparse: sparse: got =FF
   builtin:8:961: sparse: sparse: Expected ; at the end of type declaration
   builtin:8:961: sparse: sparse: got ?
   builtin:8:212: sparse: sparse: expression expected before '=FF'
   builtin:8:212: sparse: sparse: Expected ; at end of declaration
   builtin:8:212: sparse: sparse: got =FF
   command-line: note: in included file (through builtin):
   include/linux/compiler_types.h:157:1: sparse: sparse: Expected ; at the =
end of type declaration
   include/linux/compiler_types.h:157:1: sparse: sparse: got }
   command-line: note: in included file:
   builtin:8:834: sparse: sparse: symbol 'o' was not declared. Should it be=
 static?
   command-line: note: in included file (through builtin):
   include/linux/compiler_types.h:144:20: sparse: sparse: symbol 'file' was=
 not declared. Should it be static?
   drivers/gpu/drm/amd/amdgpu/gfxhub_v1_2.c: note: in included file (throug=
h drivers/gpu/drm/amd/amdgpu/amdgpu_virt.h, drivers/gpu/drm/amd/amdgpu/amdg=
pu.h):
   drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h:315:49: sparse: sparse: stat=
ic assertion failed: "amd_sriov_msg_vf2pf_info must be 1 KB"
   drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h:319:49: sparse: sparse: stat=
ic assertion failed: "amd_sriov_msg_pf2vf_info must be 1 KB"
--
   command-line: note: in included file:
   builtin:2:0: sparse: sparse: missing terminating " character
   builtin:3:0: sparse: sparse: missing terminating " character
   builtin:4:0: sparse: sparse: missing terminating ' character
   builtin:9:871: sparse: sparse: no newline at end of file
>> builtin:9:871: sparse: sparse: End of file in the middle of a comment
   builtin:2:1: sparse: sparse: Expected ; at the end of type declaration
   builtin:2:1: sparse: sparse: got
   command-line: note: in included file (through builtin):
   include/linux/compiler_types.h:157:1: sparse: sparse: Expected ; at the =
end of type declaration
   include/linux/compiler_types.h:157:1: sparse: sparse: got }
   include/linux/compiler_types.h:144:20: sparse: sparse: symbol 'file' was=
 not declared. Should it be static?
--
   command-line: note: in included file:
   builtin:2:0: sparse: sparse: missing terminating " character
   builtin:9:0: sparse: sparse: missing terminating ' character
   builtin:25:1000: sparse: sparse: End of file in middle of string
>> builtin:9:2: sparse: sparse: unrecognized preprocessor line '=07=FE=7F=
=0F'
   builtin:10:2: sparse: sparse: unrecognized preprocessor line '=07=FE=7F=
=19'
   builtin:11:2: sparse: sparse: unrecognized preprocessor line '=07=FE=7F4'
   builtin:12:2: sparse: sparse: unrecognized preprocessor line '=07=FE=7FZ'
   builtin:13:2: sparse: sparse: unrecognized preprocessor line '=07=FE=7Ft'
   builtin:14:2: sparse: sparse: unrecognized preprocessor line '=07=FE=7F=
=7F'
   builtin:15:2: sparse: sparse: unrecognized preprocessor line '=07=FE=7F=
=91'
   builtin:16:2: sparse: sparse: unrecognized preprocessor line '=07=FE=7F=
=A0'
   builtin:17:2: sparse: sparse: unrecognized preprocessor line '=07=FE=7F=
=AC'
   builtin:18:2: sparse: sparse: unrecognized preprocessor line '=07=FE=7F=
=C1'
   builtin:19:2: sparse: sparse: unrecognized preprocessor line '=07=FE=7F=
=CB'
   builtin:20:2: sparse: sparse: unrecognized preprocessor line '=07=FE=7F=
=E7'
   builtin:21:2: sparse: sparse: unrecognized preprocessor line '=07=FE=7F=
=F7'
   builtin:22:2: sparse: sparse: unrecognized preprocessor line '=07=FE=7F=
=16 #=07=FE=7F( #=07=FE=7Fo #=07=FE=7F=A1=0E#=07=FE=7F=AE=0E#=07=FE=7F=D5=
=0E#=07=FE=7F<=0F#=07=FE=7Fa=0F#=07=FE=7F=9C=0F#=07=FE=7F=AC=0F#=07=FE=7F=
=BB=0F#=07=FE=7F=CA=0F#=07=FE=7F!`?=07=FE=7F=10=FF=FB=EB=BF=06=10=11d=03@=
=D0 =91#V=048=05'
   builtin:2:1: sparse: sparse: Expected ; at the end of type declaration
   builtin:2:1: sparse: sparse: got =91
   command-line: note: in included file (through builtin):
   include/linux/compiler_types.h:157:1: sparse: sparse: Expected ; at the =
end of type declaration
   include/linux/compiler_types.h:157:1: sparse: sparse: got }
   include/linux/compiler_types.h:144:20: sparse: sparse: symbol 'file' was=
 not declared. Should it be static?
--
   command-line: note: in included file:
>> builtin:1:460: sparse: sparse: x used with no following hex digits
   builtin:2:0: sparse: sparse: missing terminating " character
   builtin:8:292: sparse: sparse: End of file in middle of string
   builtin:2:1: sparse: sparse: Expected ; at the end of type declaration
   builtin:2:1: sparse: sparse: got
   builtin:2:122: sparse: sparse: Expected ; at the end of type declaration
   builtin:2:122: sparse: sparse: got =EC
   builtin:2:130: sparse: sparse: Expected ; at the end of type declaration
   builtin:2:130: sparse: sparse: got =EC
   builtin:2:138: sparse: sparse: Expected ; at the end of type declaration
   builtin:2:138: sparse: sparse: got =EC
   builtin:2:146: sparse: sparse: Expected ; at the end of type declaration
   builtin:2:146: sparse: sparse: got =EC
   builtin:2:154: sparse: sparse: Expected ; at the end of type declaration
   builtin:2:154: sparse: sparse: got =EC
   builtin:2:34: sparse: sparse: Expected ; at end of declaration
   builtin:2:34: sparse: sparse: got =EC
   builtin:4:137: sparse: sparse: Expected ; at the end of type declaration
   builtin:4:137: sparse: sparse: got =D8
   builtin:6:618: sparse: sparse: Expected ; at the end of type declaration
   builtin:6:618: sparse: sparse: got =ED
   builtin:6:626: sparse: sparse: Expected ; at the end of type declaration
   builtin:6:626: sparse: sparse: got =ED
   builtin:6:634: sparse: sparse: Expected ; at the end of type declaration
   builtin:6:634: sparse: sparse: got =ED
   command-line: note: in included file (through builtin):
   include/linux/compiler_types.h:157:1: sparse: sparse: Expected ; at the =
end of type declaration
   include/linux/compiler_types.h:157:1: sparse: sparse: got }
   command-line: note: in included file:
   command-line: note: in included file (through builtin):
   include/linux/compiler_types.h:144:20: sparse: sparse: symbol 'file' was=
 not declared. Should it be static?

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
