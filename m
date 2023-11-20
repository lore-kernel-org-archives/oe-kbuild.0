Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2D81358A4;
	Mon, 20 Nov 2023 19:47:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DMWAtjAW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700509671; x=1732045671;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=hiIgakyFH/t9g/GhYtUbqZuSvfbFFDFs3oErkRhnQh4=;
  b=DMWAtjAWJH2hIsMcVWURsZAkaAxeMtoHEeO5m/+uuAKVMM1PHzSijZ+1
   621w/xlwvKKpqcyt0WdEEri6XOR+syNeBvim8om7rUkklhtqs/9OyiEH1
   3aA0yllb6WLAHlL+ZFYfEvPq3u6beS98Q1r+5FIEAhoRZTcFKSIikPL5F
   +Yk+RMgmbT+liZBSogjYS937ZvJcgRsCMUOdm5GmB6C5jhkrAmULUrKhI
   doGG/5NJVmZp8bfCRSw3jhe0N8EL0UaKJPHLOBbdTDiwV6Dhy09PXL6Lh
   7NSjKhw1NnW7/56EjvLTlUuB9ElePXaqUemqpwXw90kOA/Dw7S0RbDvMh
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10900"; a="394537037"
X-IronPort-AV: E=Sophos;i="6.04,214,1695711600"; 
   d="scan'208";a="394537037"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2023 11:47:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10900"; a="1013682736"
X-IronPort-AV: E=Sophos;i="6.04,214,1695711600"; 
   d="scan'208";a="1013682736"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
  by fmsmga006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 20 Nov 2023 11:47:45 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Mon, 20 Nov 2023 11:47:45 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Mon, 20 Nov 2023 11:47:45 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Mon, 20 Nov 2023 11:47:45 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.168)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Mon, 20 Nov 2023 11:47:44 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n2DtF8rymyzAvSSVRcZL7Tl3kUhlg0ZrlTiZU20IjRke9yrUpeebfYCFF4Fh5i51+ZEoqwKSl8K9Yw8a9pn2o6vpqOqSmHFyfwQpPG2HojNyoI/FcKjldgAzMSd7y6Q54XNgdu3gJ4+W8M6ZQgyUM53z1gNfZ/yrE41/31OuVFVVHxoRVWJqNYU8MA45+lZ4lNuxxT32ZyWbm/p9rQgV5r7xyyTLdsdj1aNN7dGjehP5bOY/dU3MkMKFXrPzloz+uxINBjI13ryQLEcEi8cwlI5gPDvChjY+TFIZW4hSOga+kRUFw/BuPCtYCY9Q1DhNGnbBxrTc3+NhKCpSzbuURQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kp8ZTvcL10VXEorqK2dtfMiIvUaC7oOtEuqOgC4prfw=;
 b=eHgRZRfA/OMvfR0OYs2f1PPmkhlTS9e65tHNkoubBrLygddweg66lyP+D59/d9h2kcyIo1R9XXo+rXhV/40h1vjLlDFqHr+4430+1KbPkIkdpCzOGQR67Aga5yh0WgJWWYmY3Tf/ZLIvBJwq8LZaBjk27VhOxXzDZIvxKqdddCMQzTBKWKjKKKI3Pt+Zp6kNdtZKWT3PaoVnH7xUZJeKr7QFZSArBx9senknIZDjc/ZAMoE91fIK74UuTwfPLr3LrxRYGVp3wFJD74DnM42BPqw1msZsjP0MLA27Nt1faJ+AHarvRvK6+bJttoE1DsFzzftDyZNuEOU31rYqmAh3uA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BYAPR11MB2647.namprd11.prod.outlook.com (2603:10b6:a02:be::12)
 by DM6PR11MB4673.namprd11.prod.outlook.com (2603:10b6:5:2a4::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.27; Mon, 20 Nov
 2023 19:47:42 +0000
Received: from BYAPR11MB2647.namprd11.prod.outlook.com
 ([fe80::b50a:8b96:5a9a:4c7]) by BYAPR11MB2647.namprd11.prod.outlook.com
 ([fe80::b50a:8b96:5a9a:4c7%7]) with mapi id 15.20.7002.027; Mon, 20 Nov 2023
 19:47:42 +0000
From: "Yamahata, Isaku" <isaku.yamahata@intel.com>
To: Dan Carpenter <dan.carpenter@linaro.org>, "oe-kbuild@lists.linux.dev"
	<oe-kbuild@lists.linux.dev>, Sagi Shahar <sagis@google.com>
CC: lkp <lkp@intel.com>, "oe-kbuild-all@lists.linux.dev"
	<oe-kbuild-all@lists.linux.dev>, "Yamahata, Isaku" <isaku.yamahata@intel.com>
Subject: RE: [intel-tdx:kvm-upstream-next 196/273] arch/x86/kvm/x86.c:14007
 pre_move_enc_context_from() warn: missing error code 'ret'
Thread-Topic: [intel-tdx:kvm-upstream-next 196/273] arch/x86/kvm/x86.c:14007
 pre_move_enc_context_from() warn: missing error code 'ret'
Thread-Index: AQHaG7FvZLr2tcU8c0iApjfpBzraULCDnR3A
Date: Mon, 20 Nov 2023 19:47:42 +0000
Message-ID: <BYAPR11MB2647803835D9EFEEAC95F4F18CB4A@BYAPR11MB2647.namprd11.prod.outlook.com>
References: <93ac3561-6437-490c-a03d-f04f3bb2a5fb@suswa.mountain>
In-Reply-To: <93ac3561-6437-490c-a03d-f04f3bb2a5fb@suswa.mountain>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR11MB2647:EE_|DM6PR11MB4673:EE_
x-ms-office365-filtering-correlation-id: 0a7cf557-375c-4443-7b91-08dbea018f3e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: F5xV+RKMVe+kXztEUiSI6bF6FfUCCn+CAPT9+GI8FMAQqDu+btTLSOhV/Rrc71QTYRv072AJP38xJevo3OlBbFWgutMySehvp6RKECQBXjh7OETXve9F/4kZkGyfPMrcMtCI8rDKz8UyOGIiB1gzdfN0uD4fbW1xYR3mAelNXWlZwcjLiEj6dH6JZ3zLDoac0eDIhlKzNdn5ROTqUnQaAPzCtORJ9g1Hu81ljenWhws71a5bqS941VEQshDDfQuzZOFEVVFBIyWE22EJ4YW1OhkYfgb9wGBZ3HSNGO2lsa6oase0ylPXsO2db5yw1JmbiIfUEgz1CZI7aOUS8i8GRt9ZZB7gnMksdfEO8nalS5RH0/30hEHKjTseKJQQcH83hShBpnyfUyKxKDNcdtE0zxOKEuBuXutsR69GFfMxolDOfMTHc7A54giEAtVF5tY/TcLSEa9CnfKVNiGnhT2FxHookuPsJBhm4XbaK0X1MBsEEx7eoeqIZKzRcmSG4V71QOavSM8DPvSWqlXH8f/nXCZjMqAMrAYpWkCyvrskbrGlYAmx/0/Jq85MnSIHbN8QasfdHX/8NCVHELcjb7AHaUE/5EymL2/A+xDpBREyTDje+oQEnjJnwrbUTbeymSknZrmeY0e/HOTn+KImtuvzxYq0g2iy/NPp9t+DszpTN2M/vTZKs0V5tSUXFWam7N5C
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR11MB2647.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(39860400002)(366004)(136003)(346002)(376002)(230922051799003)(230173577357003)(230273577357003)(451199024)(64100799003)(186009)(1800799012)(41300700001)(5660300002)(86362001)(52536014)(33656002)(2906002)(38070700009)(9686003)(7696005)(107886003)(122000001)(55016003)(26005)(83380400001)(966005)(478600001)(82960400001)(6506007)(71200400001)(38100700002)(110136005)(4326008)(8936002)(76116006)(316002)(54906003)(66946007)(64756008)(66556008)(66446008)(66476007)(8676002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?5u7/yUFPbTDTnMKkhiHv9n0A6hjy8eLzkAS0P156sVVwO4LsxULRNNzS4E2Q?=
 =?us-ascii?Q?MTy0YFtoxKX2I3UCdupO0jT4Qt/fd2e8nh18RoTfFvihVSkrqFyT5PE6KMRa?=
 =?us-ascii?Q?0jf1zTlYEn24mOrRH6rblmSaauaVvTX8pqxvVtM+3R2Bstz96gIfCVPg32mU?=
 =?us-ascii?Q?BwcYlLzM9fDlgGjIFnaSRbzq2bEb+2uOAyVOmm7KZq13nvGDIVASSa7c/Cfk?=
 =?us-ascii?Q?MnkgyVpb8O3pU3hBm+7dugkjdV4pte3Sj8IQ1kGCFBiP1O6DPrF3cPt4LTPZ?=
 =?us-ascii?Q?ejdYgivjEpLDh30BRRuEE8o1hFIW9W8S3cXJPyqlnnExpblfGUuDtxacKGv0?=
 =?us-ascii?Q?A/ZktcMUIdnxqrZURsmIR5+OvInZIUc/8gainj640mWqDCfRWp6P5pQh6GB+?=
 =?us-ascii?Q?7Ab94vN6V31eQ+8VBscDpOpsgCvn+pPT07gpgOgnCsbcnkfQbeH8jXQQkib9?=
 =?us-ascii?Q?OXNtdm0PJa+iQ4B5KHipI39KbOvdfdwMv5Vmnohn1Ci/ulXLnkcFoQF6tOtq?=
 =?us-ascii?Q?h+BU/tCfnDDXaUh+2lPA7lflxdyhEcCYFU6sVhBxp2ALzxnWFDMA9reNJWvM?=
 =?us-ascii?Q?lYD5LObcrhRX8gG1nvJJRoz+uQf+JG/El1V/Ng4t958QhyU8iGiNcbZPsE6b?=
 =?us-ascii?Q?zKECHsFTP6C1Outah4a/BtwwZBBYDSMd8+ZXO4wcgSnsFJIwR/ip414IsTQK?=
 =?us-ascii?Q?9QFnk8xJY15kaVhAJ/yiMtgONDqZQY65JhtQ/7M1b1mfBVtppgOsyrNuWI1B?=
 =?us-ascii?Q?VRDIZ6e7jXuUTcWvgo/OlqMafYntt7iH5J+3ks+TuY3Apxt2v08eTsa/38pA?=
 =?us-ascii?Q?Ct9mz9Rvwzxs5qBkL83L7UguavSJlK30i9iVZ648tdsxVWewuNm5o1EPh6vO?=
 =?us-ascii?Q?uuTkBeScrMKn7/zEeUqZJJzy0EPW4x89tz+DNrLPARUbl4EMiJiLUSL74Ql/?=
 =?us-ascii?Q?w/TxA1Tt6LfBbPcLRXVcxE30vWyR//JBUDkRkatG2+Pm2C/ivmJImlNuEr6j?=
 =?us-ascii?Q?lrgTbel/POAfRE+2ZwCaAEzoH/t45qMk/jOd+iq4Pkw6g7Km8skw7i5/c9U3?=
 =?us-ascii?Q?tJPXp/TC0Dw7QkbvY4uMCGYnV6H+5nAp5wgWrbbiTgSvqQVoNTk/ZY5UtTUk?=
 =?us-ascii?Q?Jl/LbYdvPBMkBrcx/G5ZTYQEqkkVcGdv6cpb4KuvSZ+YGL8wZ4iitTn/Jr6D?=
 =?us-ascii?Q?JpEAknOieJvWf6RCjkb1D2XHXt/b2Pz57EoUvqSLsXTspMH9+8e+87+Inawh?=
 =?us-ascii?Q?fIi7Lotk2UaUN078v9uz0XLddnlYRqDk7NsqtSmNQykVoIb0MUOj2FJLAG6l?=
 =?us-ascii?Q?ZU89ZOsncnoj+jHW6EVydeawjrWgOVibPfjQsBo7x+KjLmVvw5UbfcjNuzWV?=
 =?us-ascii?Q?5b9ymaFVKJCma2CrWqxajOSq85FfU89PMXGqQmCxhgPJ7v0NXfJncBlvhDNb?=
 =?us-ascii?Q?XJWtI1a+XgDfw4cHQr6Pv4NVfwdvgZSQRz+fGy9oERD1mdBgIEGGA6+e1kee?=
 =?us-ascii?Q?2E6KyhSJdOFHmtOu8fpqN6L7Bmg2WjiH7ufTTAJN891e5FNDwQR2jWgiToEh?=
 =?us-ascii?Q?IfqKximsZbp5aG9kGGr2RS+0mfVEYw5gZPK4lZRY?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2647.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a7cf557-375c-4443-7b91-08dbea018f3e
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Nov 2023 19:47:42.1911
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XuSnCRpeR5N+dCOL0Ywyuz3Ef0zNTm/RTovvAvgaQFNkAB43FS/7FJ6RDOvyzgBB7yAeu/oy/5zeKvj5aRngiJ4L5hadBKIyjgDeacELdt8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4673
X-OriginatorOrg: intel.com

> tree:   https://github.com/intel/tdx.git kvm-upstream-next
> head:   90fec84219b5d2bf13e61f02777f6a44ab755bc4
> commit: bf2a53c6d4d7151ace11879b20cacf6b07bdedcb [196/273] KVM: SEV: Refa=
ctor common code out of
> sev_vm_move_enc_context_from
> config: x86_64-randconfig-161-20231117 (https://download.01.org/0day-ci/a=
rchive/20231117/202311171500.e2f5AH17-
> lkp@intel.com/config)
> compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
> reproduce: (https://download.01.org/0day-ci/archive/20231117/202311171500=
.e2f5AH17-lkp@intel.com/reproduce)
>=20
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Reported-by: Dan Carpenter <error27@gmail.com>
> | Closes: https://lore.kernel.org/r/202311171500.e2f5AH17-lkp@intel.com/
>=20
> New smatch warnings:
> arch/x86/kvm/x86.c:14007 pre_move_enc_context_from() warn: missing error =
code 'ret'
>=20
> vim +/ret +14007 arch/x86/kvm/x86.c
>=20
> bf2a53c6d4d715 Sagi Shahar 2023-04-07  13983  int pre_move_enc_context_fr=
om(struct kvm *dst_kvm, struct kvm *src_kvm,
> bf2a53c6d4d715 Sagi Shahar 2023-04-07  13984  			      atomic_t *dst_migr=
ation_in_progress,
> bf2a53c6d4d715 Sagi Shahar 2023-04-07  13985  			      atomic_t *src_migr=
ation_in_progress)
> bf2a53c6d4d715 Sagi Shahar 2023-04-07  13986  {
> bf2a53c6d4d715 Sagi Shahar 2023-04-07  13987  	struct kvm_vcpu *src_vcpu;
> bf2a53c6d4d715 Sagi Shahar 2023-04-07  13988  	unsigned long i;
> bf2a53c6d4d715 Sagi Shahar 2023-04-07  13989  	int ret =3D -EINVAL;
> bf2a53c6d4d715 Sagi Shahar 2023-04-07  13990
> bf2a53c6d4d715 Sagi Shahar 2023-04-07  13991  	ret =3D lock_two_vms_for_m=
igration(dst_kvm, src_kvm,
> bf2a53c6d4d715 Sagi Shahar 2023-04-07  13992  					 dst_migration_in_prog=
ress,
> bf2a53c6d4d715 Sagi Shahar 2023-04-07  13993  					 src_migration_in_prog=
ress);
> bf2a53c6d4d715 Sagi Shahar 2023-04-07  13994  	if (ret)
> bf2a53c6d4d715 Sagi Shahar 2023-04-07  13995  		return ret;
> bf2a53c6d4d715 Sagi Shahar 2023-04-07  13996
> bf2a53c6d4d715 Sagi Shahar 2023-04-07  13997  	ret =3D lock_vcpus_for_mig=
ration(dst_kvm, MIGRATION_TARGET);
> bf2a53c6d4d715 Sagi Shahar 2023-04-07  13998  	if (ret)
> bf2a53c6d4d715 Sagi Shahar 2023-04-07  13999  		goto unlock_vms;
> bf2a53c6d4d715 Sagi Shahar 2023-04-07  14000
> bf2a53c6d4d715 Sagi Shahar 2023-04-07  14001  	ret =3D lock_vcpus_for_mig=
ration(src_kvm, MIGRATION_SOURCE);
> bf2a53c6d4d715 Sagi Shahar 2023-04-07  14002  	if (ret)
> bf2a53c6d4d715 Sagi Shahar 2023-04-07  14003  		goto unlock_dst_vcpu;
> bf2a53c6d4d715 Sagi Shahar 2023-04-07  14004
> bf2a53c6d4d715 Sagi Shahar 2023-04-07  14005  	if (atomic_read(&dst_kvm->=
online_vcpus) !=3D
> bf2a53c6d4d715 Sagi Shahar 2023-04-07  14006  	    atomic_read(&src_kvm->=
online_vcpus))
> bf2a53c6d4d715 Sagi Shahar 2023-04-07 @14007  		goto unlock_dst_vcpu;
>=20
> Missing error code?
>=20
> bf2a53c6d4d715 Sagi Shahar 2023-04-07  14008
> bf2a53c6d4d715 Sagi Shahar 2023-04-07  14009  	kvm_for_each_vcpu(i, src_v=
cpu, src_kvm) {
> bf2a53c6d4d715 Sagi Shahar 2023-04-07  14010  		if (!src_vcpu->arch.guest=
_state_protected)
> bf2a53c6d4d715 Sagi Shahar 2023-04-07  14011  			goto unlock_dst_vcpu;
>=20
> Here too.

Yes. I'll fix the patch on the next respin in my tree.
Sagi, you'd like to fix your own tree.

diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index 71a50d905ecf..97f406051396 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -14147,7 +14147,7 @@ int pre_move_enc_context_from(struct kvm *dst_kvm, =
struct kvm *src_kvm,
 {
        struct kvm_vcpu *src_vcpu;
        unsigned long i;
-       int ret =3D -EINVAL;
+       int ret;
=20
        ret =3D lock_two_vms_for_migration(dst_kvm, src_kvm,
                                         dst_migration_in_progress,
@@ -14164,12 +14164,16 @@ int pre_move_enc_context_from(struct kvm *dst_kvm=
, struct kvm *src_kvm,
                goto unlock_dst_vcpu;
=20
        if (atomic_read(&dst_kvm->online_vcpus) !=3D
-           atomic_read(&src_kvm->online_vcpus))
+           atomic_read(&src_kvm->online_vcpus)) {
+               ret =3D -EINVAL;
                goto unlock_dst_vcpu;
+       }
=20
        kvm_for_each_vcpu(i, src_vcpu, src_kvm) {
-               if (!src_vcpu->arch.guest_state_protected)
+               if (!src_vcpu->arch.guest_state_protected) {
+                       ret =3D -EINVAL;
                        goto unlock_dst_vcpu;
+               }
        }
=20
        return 0;
