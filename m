Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE1E5134A3
	for <oe-kbuild@lists.linux.dev>; Sun,  7 Jan 2024 12:02:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bzgaLchg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1704628964; x=1736164964;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=AkqU1S4V+srQPOJW5K3IiL2vbYnUymKkIBEKpQM3TOQ=;
  b=bzgaLchge4/0OwLSjVaFRRluTHEb/WAAXgnhfxNl44IW29a6ozZzyXF9
   6HnrCiCkRuJlPsq+0Pr5+PQkW2klhnYU17ImbXyi556n7zrDIAsHOHmEW
   n9y3JCaPtIqCzOWeUTDjpAH3lv/+JImz6TDGl9iZ3/HkMOIqgSv9Rf5qx
   EOtckDRBa6XpGXgm5R1Ro/tLxa58wh/UcEGmfe8Scf/Ih+03iwJFC+NDD
   VpfIrVmj9PS8vULETkYW8r95zrTiAtJ1isQl/zqDDFIJYPPqNQr9U3km/
   ISUWSWVLzZYh9B0Gi6zhcGhXiE5FEsC/i1zt9jHcfYTsxQXDFT8Uui6Ai
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10945"; a="400479632"
X-IronPort-AV: E=Sophos;i="6.04,338,1695711600"; 
   d="scan'208";a="400479632"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jan 2024 04:02:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10945"; a="851544315"
X-IronPort-AV: E=Sophos;i="6.04,338,1695711600"; 
   d="scan'208";a="851544315"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
  by fmsmga004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 07 Jan 2024 04:02:43 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Sun, 7 Jan 2024 04:02:43 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Sun, 7 Jan 2024 04:02:42 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Sun, 7 Jan 2024 04:02:42 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Sun, 7 Jan 2024 04:02:42 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Bh+fkZbQt4qPhsEfcYnXEf53LoznxuvR0HpW08WwdTfXjDKD2onnnQBes2/EVZzb8EnGq1f9j/xaOC8hNhWot+Ixfkc/Hv/yVP8vdj6NhBd6kdUn+Jf7Auq1tJWQ2dy5B3YStLM54dpF+5QeWzMw9ofM1AMXrXCuTHFOhjaAxW8gmqwCrdOaxhEUEG8pTZx/3iWWAUd4AAjUo+UXqfjwrUFBXh9eJJgTIqZbovtb7E7qwL+s+kF2j5PWvCTQ6HCuy8sbnLqhwggY1Oy72AV1KOdIM6KIXqvL/MDN71B8oL0/T04fCykFLPb43t3AWqQh2StOTYrPGI3BKiu9oh6WnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i0M0Ytnelm3/eP1jakpO55bwRYLJjc/iHQmBQnZmEcM=;
 b=bOa01SaefpvckfTdyVjk7uSNliCqzwhqsaSGHvKBcAjz+iixyY392UQvF5Qn2D4GjxxjHbQsGEN8ek3Pfjx99Jw+FUOvFms/J+5tUxGd8b18rBDqOnkCxZro7F0SnnZ4Df8g5nQRPJq6TdPBTNkKejzyagNvcZ00q72iZ1JnKGtMTq7vefi3DuF1fzDJDKykVKAsYZlY9kb0VFF6YSSZNnTL1BdX5sSuBfzvAGGYyJgxaqXtlJSh6UWeGqjD9KDucXKw3McJQ+f6sWwIF6K+TQFaE6m0Ka/UPkXIVdazb+oVTxpJLkTpBUp578EcWNWen+5fxRtZKmV1YbAWVwhW7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6392.namprd11.prod.outlook.com (2603:10b6:930:37::15)
 by BN9PR11MB5228.namprd11.prod.outlook.com (2603:10b6:408:135::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.21; Sun, 7 Jan
 2024 12:02:39 +0000
Received: from CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::b99c:f603:f176:aca]) by CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::b99c:f603:f176:aca%5]) with mapi id 15.20.7159.020; Sun, 7 Jan 2024
 12:02:39 +0000
From: "Liu, Yujie" <yujie.liu@intel.com>
To: lkp <lkp@intel.com>, "oe-kbuild@lists.linux.dev"
	<oe-kbuild@lists.linux.dev>
Subject: RE: [PATCH 5/5] crash: clean up CRASH_DUMP
Thread-Topic: [PATCH 5/5] crash: clean up CRASH_DUMP
Thread-Index: AQHaQStqbFyMmiuBykiNYmxdTTMvJrDOQEcw
Date: Sun, 7 Jan 2024 12:02:39 +0000
Message-ID: <CY5PR11MB6392A0A9F2BCEF7F12B49954FB642@CY5PR11MB6392.namprd11.prod.outlook.com>
References: <202401071326.52yn9Ftd-lkp@intel.com>
In-Reply-To: <202401071326.52yn9Ftd-lkp@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR11MB6392:EE_|BN9PR11MB5228:EE_
x-ms-office365-filtering-correlation-id: 1b1e02c6-d8b1-43b1-6498-08dc0f788bea
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: yYeucfL0VLY+RsBByLzcUk9OwlrMge2VB5Iq9zV5rauMW/jHERw0CyGUPsJ/ltbkooHmH3KLMSBxu1jO1iRh9klTGLZGcHdHR6J11z7B4JRopB9dxus7iYDGCumFRpNI7ixFNzwB4ZLgdLWtwWCgU8I8J2kveU0rLwje2FxvHIu1+HhSRUpbQTwgcPBAqbFAtFGRO+0cMAYN9o0D7ZyETUCpKjs7z3POSDpAvK3yCAvU7hTZdm832fPD6BPJwi4A6wNQfNkNEekVCjfFqnk8hlzlDsA9allN4fBTC1+AJU1giu8AJS36pVVh2UKMt64P5bJQ4UFCly6Ev49ophCE4HHMYXKG4/0d6b2nSUs/Se8Y0rf73mQib7HoXcrdIF+3xbPWb0rYZB1lpWU7s2WkVsFFeyGZJXywSpFUwIzuuyp9oqs9ftBp+OfoqCdNHMj6ZMqTniFoeSyVVJtKeX91xeU0wopeu5I0Ru9z7hupLpMNqStwV8qZAnQgpp0rwTk2tyk2znD8Ayv/KI0Ow4A8NwqN3JXJ1mv7ZfZN9/ziQR7SNm7iOdWqlKqdim5QFBen0uJhpkuSzgPtRPuXyn0VEiFFWTOtb9nMsTpHui8vP3igPHawPkKfLIXGsyClA0t1ykNvuw8gZLcOVHqS2nWa3w==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR11MB6392.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(346002)(376002)(366004)(136003)(39860400002)(230922051799003)(186009)(451199024)(1800799012)(64100799003)(66946007)(66476007)(66556008)(76116006)(316002)(52536014)(8676002)(8936002)(26005)(478600001)(83380400001)(66446008)(64756008)(966005)(71200400001)(55016003)(2906002)(122000001)(5660300002)(38070700009)(41300700001)(38100700002)(82960400001)(7696005)(86362001)(6506007)(9686003)(110136005)(53546011)(33656002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?O9u8bL+WtzkIOpZN2lY73PXc9q2uV/eUHiqVxtyq+XLzbwsuS3yKPC8w522l?=
 =?us-ascii?Q?wXBBUzxe00CbPjQOU6qyAETuNkvq5LnBwPjubioAv9z1qL9lGuQwD/o6KJII?=
 =?us-ascii?Q?Z2ULsgAD+M1LsEG+oZpQIx1G5746pMjevdrXBWm4NvHgvaxR2ERd0aWub5dz?=
 =?us-ascii?Q?RVFI1d0mmiFij6dyDB7IQFCYttoXMj299gCnKFAfg8uFmKo5x8EX1hVQddp0?=
 =?us-ascii?Q?AQvBvNslzSs15vkCX8Chk+0w74J74IyuqlvD9GjKggMoIv2iaMXpw3OHLGbT?=
 =?us-ascii?Q?y26niPhtsTbr1zrEJSlCN9xAaEYFRjzVhnV4GJzbIVR6MRO59JddSzXY03Tw?=
 =?us-ascii?Q?GBV4EMrG+kVMT08cjY/ABVdWxZYlVuWiUYr7pEyOTGxkp5hziD1i2yNxBXDA?=
 =?us-ascii?Q?RHZyHDSWpgloU7ZgI41XQVl9Td1XnwEFnqhKupejpSnOu9hYI49vvbVf8PFl?=
 =?us-ascii?Q?jZan8UXPEm2RpGwew5L6w2WD1xGeeJixZIIEcUgBQgucRQ6N4c2hzPaoWd4i?=
 =?us-ascii?Q?wXPQJGNhEEgrLoKrH9FURK87a3U4Yko7CtixAy9kn6AjjWPYG8uahUpmoAMA?=
 =?us-ascii?Q?aAVX+Si8cLm8ZUMrKMRpN5qXIhJBRwfFjIz6k6dKTSXagVtzcO5E1Dek6AlR?=
 =?us-ascii?Q?qHNnRbE0b5onjT8wfmaaL91LQWBUhzLMUdWV51bt+NMkJsaD9OV6ExxwlCbV?=
 =?us-ascii?Q?BcKIgCriJ147bQKwrjObLpYBoDmkVQ5HItQ7TJ7Cmk+Sj4Ic/HwcMz/iaPnd?=
 =?us-ascii?Q?d25cIPU74m8GXEFlVPibyG7wjmxsLDiQfuF21odeQDQir30JaS+KfIOkaEbf?=
 =?us-ascii?Q?jq3Gi0H2lvHd+9OvBL5lLfVjEJSqV+NhQK+BLyHQln0GZCciPbskdPP+23Z+?=
 =?us-ascii?Q?I5HujX/tyTbAdmA2RG7rLE2b7RckP6JrJJ1VwGE+l8vIAmUdq7Tkbln6izLb?=
 =?us-ascii?Q?e7qEDdweay9dY6CKMgVaqzOqTpJyXfR2VSh0gJXMGSehaSp2c0YvCFnv/B5f?=
 =?us-ascii?Q?s8Onpxq3tFBGdSevoKyA5TWTzl7aMz+3X+RS9hqs3B2n61DPbwViLIdsxTya?=
 =?us-ascii?Q?IPVuAGeoFjjI4zKHmnxFydc6NQsJYPkIKhwXbic3Om2i3FF9tQM/2KWquFTK?=
 =?us-ascii?Q?ixyI25IfVzdi292jhMUY0Gd9vOWuAHTe7GhYp6ETbq4kLYGmQYt0kASMZ7Iu?=
 =?us-ascii?Q?1EVzdDRvIMdTaRRkpnCRPTW7hW5byxgXonbFGUihmFGlA3H2fdVwmV5FRuOA?=
 =?us-ascii?Q?DU6bctZDnJXEiN8sFNJuPUNppezyfRdirTHkYgoqvEC1FC6HDCD1PZJvH0gd?=
 =?us-ascii?Q?Pcjh7EbqZJYs2PIpOw/25d/3G/NtHn+3fP3ejz7l/lwS+Pa9X3RlX/bKpBvy?=
 =?us-ascii?Q?oS+2CUWEzSjPHaGRU9MomUDTkWTGbKbUAsDfeVVe3a7/tJlT6f76+46xvbYd?=
 =?us-ascii?Q?Z+aj6NWV4TqyXK//YDPmfYTGPDtk9WzjJl9g3Qh90D6RjqwPp8KbsKGKqr31?=
 =?us-ascii?Q?OFaHfNw5niwa2s0D5fuu1ZlXmimXDR7P019fti1zIde2edXGV8zdCO8HjjXa?=
 =?us-ascii?Q?++5OBc6wc51s2/YMw0DgqPtBt3z5is/kWFpFfCZL?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6392.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b1e02c6-d8b1-43b1-6498-08dc0f788bea
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Jan 2024 12:02:39.7625
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RF0PyDcxU80KSqPa6xU7NSbqtt3YtgO4/kcb6DptvkfMnzD9pyHnd3N6pwzJ/RETpnL/DGQufA+9cZ+w0bdT3g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5228
X-OriginatorOrg: intel.com

not_report

Kconfig dependency has been changed. Parent and FBC have different configs:

$ diff -u f25c0472deffb898caf2da8da52d3ea6102d1729/.config 7333c88ae6edc932=
029b07135a3653218f164f06/.config
--- f25c0472deffb898caf2da8da52d3ea6102d1729/.config    2024-01-07 11:40:15=
.518971231 +0800
+++ 7333c88ae6edc932029b07135a3653218f164f06/.config    2024-01-07 10:56:19=
.384251725 +0800
@@ -289,6 +289,8 @@
 #
 # Kexec and crash features
 #
+CONFIG_CRASH_RESERVE=3Dy
+CONFIG_VMCORE_INFO=3Dy
 CONFIG_KEXEC_CORE=3Dy
 # CONFIG_KEXEC is not set
 CONFIG_KEXEC_FILE=3Dy

-----Original Message-----
From: lkp <lkp@intel.com>=20
Sent: Sunday, January 7, 2024 13:34
To: oe-kbuild@lists.linux.dev
Cc: lkp <lkp@intel.com>
Subject: Re: [PATCH 5/5] crash: clean up CRASH_DUMP

::::::=20
:::::: Manual check reason: "only kconfig file changed"
:::::: Manual check reason: "low confidence static check first_new_problem:=
 ld.lld: error: undefined symbol: crashk_res"
::::::=20

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20240105103305.557273-6-bhe@redhat.com>
References: <20240105103305.557273-6-bhe@redhat.com>
TO: Baoquan He <bhe@redhat.com>
TO: linux-kernel@vger.kernel.org
CC: akpm@linux-foundation.org
CC: kexec@lists.infradead.org
CC: hbathini@linux.ibm.com
CC: arnd@arndb.de
CC: ignat@cloudflare.com
CC: eric_devolder@yahoo.com
CC: viro@zeniv.linux.org.uk
CC: ebiederm@xmission.com
CC: x86@kernel.org
CC: linux-arm-kernel@lists.infradead.org
CC: linuxppc-dev@lists.ozlabs.org
CC: linux-riscv@lists.infradead.org
CC: linux-fsdevel@vger.kernel.org
CC: Baoquan He <bhe@redhat.com>
CC: kernel test robot <lkp@intel.com>

Hi Baoquan,

kernel test robot noticed the following build errors:

[auto build test ERROR on linus/master]
[also build test ERROR on v6.7-rc8]
[cannot apply to powerpc/next powerpc/fixes tip/x86/core arm64/for-next/cor=
e next-20240105]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Baoquan-He/kexec_cor=
e-move-kdump-related-codes-from-crash_core-c-to-kexec_core-c/20240105-22373=
5
base:   linus/master
patch link:    https://lore.kernel.org/r/20240105103305.557273-6-bhe%40redh=
at.com
patch subject: [PATCH 5/5] crash: clean up CRASH_DUMP
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: x86_64-randconfig-122-20240106 (https://download.01.org/0day-ci/arc=
hive/20240107/202401071326.52yn9Ftd-lkp@intel.com/config)
compiler: ClangBuiltLinux clang version 17.0.6 (https://github.com/llvm/llv=
m-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20240107/202401071326.52yn9Ftd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202401071326.52yn9Ftd-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: crashk_res
   >>> referenced by initramfs.c:638 (init/initramfs.c:638)
   >>>               init/initramfs.o:(kexec_free_initrd) in archive vmlinu=
x.a
   >>> referenced by initramfs.c:638 (init/initramfs.c:638)
   >>>               init/initramfs.o:(kexec_free_initrd) in archive vmlinu=
x.a
   >>> referenced by initramfs.c:0 (init/initramfs.c:0)
   >>>               init/initramfs.o:(kexec_free_initrd) in archive vmlinu=
x.a
   >>> referenced 77 more times
--
>> ld.lld: error: undefined symbol: parse_crashkernel
   >>> referenced by setup.c:479 (arch/x86/kernel/setup.c:479)
   >>>               arch/x86/kernel/setup.o:(arch_reserve_crashkernel) in =
archive vmlinux.a
--
>> ld.lld: error: undefined symbol: crashk_low_res
   >>> referenced by machine_kexec_64.c:539 (arch/x86/kernel/machine_kexec_=
64.c:539)
   >>>               arch/x86/kernel/machine_kexec_64.o:(kexec_mark_crashkr=
es) in archive vmlinux.a
   >>> referenced by machine_kexec_64.c:539 (arch/x86/kernel/machine_kexec_=
64.c:539)
   >>>               arch/x86/kernel/machine_kexec_64.o:(kexec_mark_crashkr=
es) in archive vmlinux.a
   >>> referenced by machine_kexec_64.c:539 (arch/x86/kernel/machine_kexec_=
64.c:539)
   >>>               arch/x86/kernel/machine_kexec_64.o:(kexec_mark_crashkr=
es) in archive vmlinux.a
   >>> referenced 36 more times
--
>> ld.lld: error: undefined symbol: crash_update_vmcoreinfo_safecopy
   >>> referenced by kexec_core.c:522 (kernel/kexec_core.c:522)
   >>>               kernel/kexec_core.o:(kimage_crash_copy_vmcoreinfo) in =
archive vmlinux.a
   >>> referenced by kexec_core.c:610 (kernel/kexec_core.c:610)
   >>>               kernel/kexec_core.o:(kimage_free) in archive vmlinux.a
--
>> ld.lld: error: undefined symbol: crash_save_vmcoreinfo
   >>> referenced by kexec_core.c:1053 (kernel/kexec_core.c:1053)
   >>>               kernel/kexec_core.o:(__crash_kexec) in archive vmlinux=
.a
--
>> ld.lld: error: undefined symbol: paddr_vmcoreinfo_note
   >>> referenced by kexec_core.c:1148 (kernel/kexec_core.c:1148)
   >>>               kernel/kexec_core.o:(crash_prepare_elf64_headers) in a=
rchive vmlinux.a
--
>> ld.lld: error: undefined symbol: append_elf_note
   >>> referenced by kexec_core.c:1390 (kernel/kexec_core.c:1390)
   >>>               kernel/kexec_core.o:(crash_save_cpu) in archive vmlinu=
x.a
--
>> ld.lld: error: undefined symbol: final_note
   >>> referenced by kexec_core.c:1392 (kernel/kexec_core.c:1392)
   >>>               kernel/kexec_core.o:(crash_save_cpu) in archive vmlinu=
x.a

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

