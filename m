Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7D032248AF
	for <oe-kbuild@lists.linux.dev>; Sat, 19 Sep 2026 13:17:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789823879; cv=fail; b=bzjNHTXfKZVJ162tK4YrCntUMt03yDAFbuYPZZmCnKT0oayutASomvuLJB+bXZIgUP9iqPZVytI/b5JRGaxMfj+k5PWKwswNVOuu1a8EoQNGmv62FdhmSeD1xcQFmu8xw24a2yJ5UFXtpCI6GsuCGAsBHfM7fiR1ScGuLT5Sgiw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789823879; c=relaxed/simple;
	bh=DI8XElWo7geX9vUum8X8CVZpRyPNq03WOiHERLkmry4=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=VXfXhZJTjIjYakdYPfUcnb+ux+MRmdcqGNHUYfgeKGkrOQ9ob2i39RHrcKQbYSqWjkkH4IVSMjQ3blybi/Wvvs7BvBMmFXPn6+jQqMyN2sCJrA0XrvqA/aDN34JMB6PnJzeom1uPIPCyjlwOwtq+rMYZDzaD2Khe5YqJeTeB5IM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EnqkNrPc; arc=fail smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EnqkNrPc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789823877; x=1821359877;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=DI8XElWo7geX9vUum8X8CVZpRyPNq03WOiHERLkmry4=;
  b=EnqkNrPcuWpuaaKvo1tSQvLy6eVS6n/Rg0TxkWVpoyvbfqMdf/u7ys5U
   1GPWPBeFgx/0TtMrNK9hatNgCSepvyJ9iXcaYWOLq0QlnN5RlxCBBjcCU
   IpfbVTVNmwfzRVIiKqDO+fBaKHuTOBOT4PSRLTjM3lFV4gjTnuzgguHWj
   r10r7TCDEFtRJGRVgUSeSj3PGoyOewk0hYOrQChaVJ6wCBv8L6bhPJ4UV
   f7YvrWOy18FljNriXH0vgfdBe/efZzWSCADtC8r2ZX91xPUKqPM+swppL
   iWJF3kKvSZ6GAL+OJrEl7Oe92yWsdGXcZTe48dkWtKpCbp4ieS3X4cQ1w
   w==;
X-CSE-ConnectionGUID: imPkWk42T9eMhScr2+lJoQ==
X-CSE-MsgGUID: f8bJnyZUQlWNYHMbvR5cAA==
X-IronPort-AV: E=McAfee;i="6800,10657,11909"; a="90366285"
X-IronPort-AV: E=Sophos;i="6.27,111,1787036400"; 
   d="scan'208";a="90366285"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Sep 2026 06:17:56 -0700
X-CSE-ConnectionGUID: myCjS+3uSq2lywf9M4PBbw==
X-CSE-MsgGUID: KkXbvacUQCWQq8Vg9AD1Rg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,111,1787036400"; 
   d="scan'208";a="271112104"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Sep 2026 06:17:56 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Sat, 19 Sep 2026 06:17:55 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Sat, 19 Sep 2026 06:17:55 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.11) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Sat, 19 Sep 2026 06:17:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=e0w0OB4X4C57Gk1/NYnfwZAh/Rn+gpNRG++xyOH/wHQB/nmX4Q2PBpnL5VeqLsbCfZfDrENIymZ4SfDJZdjDcKrhaC/e7EOOFdzOfQbdJpM6NGd5UX8xs/a69epQmuN52Z0zaLjkjZpHZc9bOxsDm2vvfAIdcHp3MG/QMcJ+V/b6/al3e29NoCn3QfOOhvxiVYsuOgRgxI8gdVqfSIUdqO33WH6xg4i8LrzzPH1yIFY2A7PYEsNe0ThN1emzxv76joyZf+IvsESitnu+8g/7X1dMJKyzjHcUeKriH4wTQVVpWyxJL99kM/jNpIYqEXVz4qEqy9IUVjvOeveS+CjzCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DrshlssazwuYYkeng5aaWTSc+0srvYPFj3NNBLmr67I=;
 b=JnvDcCRSch9pHWQXSQ0X+REFn0FPXorw3OsTjnXENeunxBcqKzdBv6OtyjaqZcjydTRQt4AHjobiBzXavy/k2poSl++De7PPpA83ejWc/2u0tjJgQ5rGY67yWwlG+ujmOx4/JfItDeHDYxYtZWxgtHRN5DPwEmHpSl9FsUdVR/w3xcHaydmANy470IvNaJmZsVnS9LPyjr2j07JSPBUK+777zOqwklkMDx8TGYcaqdQX8nh9Cz5T1tUwExjQ7HU7LoejbApDVHw1VuyG+eSEpUe13a6Lugdsli6vb27Z9FD+Q9u5/9Uo4nzA06OsHR299I0xlJhRSqPV8wxPZZVSxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS6PR11MB362586.namprd11.prod.outlook.com (2603:10b6:8:4c4::14)
 by PH0PR11MB5111.namprd11.prod.outlook.com (2603:10b6:510:3c::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.14; Sat, 19 Sep
 2026 13:17:52 +0000
Received: from DS6PR11MB362586.namprd11.prod.outlook.com
 ([fe80::71a6:38f9:43ed:8f8a]) by DS6PR11MB362586.namprd11.prod.outlook.com
 ([fe80::71a6:38f9:43ed:8f8a%6]) with mapi id 15.21.0428.014; Sat, 19 Sep 2026
 13:17:51 +0000
Date: Sat, 19 Sep 2026 21:17:42 +0800
From: Philip Li <philip.li@intel.com>
To: Koichiro Den <den@valinux.co.jp>
CC: kernel test robot <lkp@intel.com>, <oe-kbuild@lists.linux.dev>, "Julia
 Lawall" <julia.lawall@inria.fr>
Subject: Re: drivers/pci/endpoint/functions/pci-epf-test.c:769:7-27: WARNING:
 Threaded IRQ with no primary handler requested without IRQF_ONESHOT (unless
 it is nested IRQ)
Message-ID: <aq6LdrdwpCXTszxK@rli9-mobl>
References: <202609190509.163Y39lZ-lkp@intel.com>
 <ldkohytwbjif3wzsbzmiihoys3q463srgi7mbnmzxn742dv2to@hvhdozk2ez4l>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <ldkohytwbjif3wzsbzmiihoys3q463srgi7mbnmzxn742dv2to@hvhdozk2ez4l>
X-ClientProxiedBy: KU2P306CA0030.MYSP306.PROD.OUTLOOK.COM
 (2603:1096:d10:3d::16) To DS6PR11MB362586.namprd11.prod.outlook.com
 (2603:10b6:8:4c4::14)
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS6PR11MB362586:EE_|PH0PR11MB5111:EE_
X-MS-Office365-Filtering-Correlation-Id: f8c55470-713f-4a7e-93fb-08df16506869
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|1800799024|376014|366016|6133799003|10067099003|56012099006|11063799006|4143699003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: eJPTbmQcvhUe9yraFBsUwIRf02hsk20PHkHcovMp98lswVQSDXXGew63fknMnZBBKBYpVAFUEYhKOHjP5L6vTQSDr0AyYMgf6OBhVwXzs1Srzva8Ba/ZcT34tAsc84xNcwuiuliCmEbqWiDlQ4HaqM8YtY3RJQyHZgjK1DujYGiS5T9mlHlqc4CpNlNJyR+ig0SOrWSv6QDXi0qkC43uszKcqJtUtYXwqe5lrtN66pga0eJCkDacBgdt0mPIqJoffJSwfX7NHSc5sKuwOq/OPPYa+QqKtgl/2UNeDs+hbMJa8CY0npzBmDS1i8nBJGxRLofhNMs0GuPet+dEEKMT6SkyYB0nWPRRr5qRyKbgLqr/LsDwJdzXyJoollcgoU9CSRMIUu+AJESEjayV/d+KRoOZwOoeFR9mrglJm48IDi4KDwNUuJvPxoD6iSp1LzJnVhbiMB/VN46geXSgHJalSH3gVf4Npm3NbKYfWn3EN5D9uzlV/rjLSkvyVMptKiOSt0Hsgvfm2LK7R9g1G2o62Yu+ioGacFZ9Fst+4IwJBhiuR521I28wFdP+8M4zYWU3UwdKqvNFT2xjOXHx0Bk8egzXHPpJUfi9X9Fmm/lJhI/nrNp4Yf/MREAqa6GnBgkT
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS6PR11MB362586.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(366016)(6133799003)(10067099003)(56012099006)(11063799006)(4143699003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?lUVR5dWvxml11WkxS2vYRe2Y1auOmqgZ65i10fMMKfD380X4vi+2+vRpb5JG?=
 =?us-ascii?Q?ELRZqsG6e2KWYnxbRmQUswhgKG53lmXWNiLJ2n7YXhDJtf5YlmYBcH2cqE+m?=
 =?us-ascii?Q?74TMNC0qeX01/0WTVXfS/3V3+tw1C48Irci6/IiXll6VDry8TDQCzjqL0c49?=
 =?us-ascii?Q?9K+zbkfuLzaC176wVKM063trtFgUYXXcw1RPQthYcOoGMdo9KRJBYqw6/rKD?=
 =?us-ascii?Q?WLZW9kgALVxgD9+nxchxaaLgwEcy7dGaeNFIGt4MryT0jko+sh1rx3KZ7oEz?=
 =?us-ascii?Q?/Qb8R/5KJg1ZhKa+ct69yBUnmlopKivtoLGmlNkIstZm82cOS65H17gM/puY?=
 =?us-ascii?Q?aw8SK5eQQr4b0Uy0X5uxoAUv3LsoewQPih/8YbJhRJm2UcCSTJ+BBDkyTOOu?=
 =?us-ascii?Q?Y2nEVfvbpCjIIr08AIbA3dp1WByzNln4GyiHZwfH1RBHQqerRK28kwTroFbZ?=
 =?us-ascii?Q?knJ2jkxNUJJRFNIPUxzcH5KG2g4KopT/QAxC0El03/zE9MUat6GnPmDgERcd?=
 =?us-ascii?Q?CoyFJfb0a7xulRVxeeIoWy7mZbaiM4E1hXUYz6IuYJct7b0tAQEtcZd4Puo5?=
 =?us-ascii?Q?3p/4naGWuxJW90rsVdlTKtxb4kvr+6gc/dXbZYoPuHGsmhfpNHRuRiZmmysZ?=
 =?us-ascii?Q?bhzc9s4MJdNcDrGm2ezOqsKr74efWGf4UIEIbYbG9E/fRh0k8l8CYqoI3Yau?=
 =?us-ascii?Q?JNQrwsv5eMyBZ76BJu8A0ewXTn70OwM8rCAfA80PIc2imJXHRIzUY5dSspsW?=
 =?us-ascii?Q?yYkI0ZXfYEYPqS6Rs0bwYCVkMlw0UlBY/RgLY7EmAtbJ0BG2HwKtG74W1424?=
 =?us-ascii?Q?4RtNMoh4TW+ZAIEFWJajvSLXYcoAufIXq49G9dKXsh2Snq8wDAJqPqNNcZFh?=
 =?us-ascii?Q?6lm6HZEQKsm+3nAn5SccD0Q+hNLekBQoxkPk3yjMmtfMq8bJsmwQ5vMGbbg7?=
 =?us-ascii?Q?gBZ5qTyfCTIzQSntY4gzfw4qVsqn315zbxE9PhQsvuitsS6pMlfe+gGhYH9H?=
 =?us-ascii?Q?BQsZc3f73BGAzggr9NDVMS6DlDEdkvzm9qsDYVpaUYPoh1heyj7QmBoqwQk7?=
 =?us-ascii?Q?2Gg/RnFFgS54p7cme4C6d/mJu3crkm+4g2rFcoMhxp7I6j2PbKhfpjCgwX5y?=
 =?us-ascii?Q?1qR1TDCTSQVVud/NyldTA1kI0EikuXjB1aHgdEJqKUULYEep/KqPJ9op9H8X?=
 =?us-ascii?Q?1B/gk5+Vl20EH0TYr20HpIr0eJ3Vvodj3nh9RmzjSoVi51Fg5QarA+oSPtJo?=
 =?us-ascii?Q?prHtNK+BptBpYmxWzjPtpndVIztV65Yt26n2RiPRER8XG9CzvH8G8geGZ5Mc?=
 =?us-ascii?Q?QBPPVIjDSa7qVNguICg6WFjheIRVOAXSq3+aQ9tId0MZKmlp7NoaLSuwkuDA?=
 =?us-ascii?Q?dnyFZeMSa+Mcoe+UJhLUGHESlr44qYhxvUfJzAMzKcaRHffxZgMHZfl7OIZw?=
 =?us-ascii?Q?eTdQkZixwmlVb/O/j1MkV3X3i7AcRX8Eel3zklOkMb8N4GNdK1rSk/0FNc8/?=
 =?us-ascii?Q?BzCyGae30dqORH/4t/ACvEvcb4s1w3aaqxX4EZix40hCi+Ic8sWJot7A9WA/?=
 =?us-ascii?Q?a3+amBf4SqncAJyxORz5kthhK1Q8abQFhJWhQyZdhZ+mp2gMwFyFnhjnmSvt?=
 =?us-ascii?Q?Isdmb9QK04wIeEFBqoxL7RQR7z38djOMrRvHhLX5XOVXFmVbjS0+IPzRnEEi?=
 =?us-ascii?Q?hPPZoCzDbeJcM170xFgQKbgmFHNDVuIb9bVOE/DhiiWZIc5he/4lSe2oZstf?=
 =?us-ascii?Q?6TFbg8akIg=3D=3D?=
X-Exchange-RoutingPolicyChecked: sx+3At/4+UTsIell5slImimr252Lmbb1+we1/YnfPtDwgFQYgL6z764Ro2WmLwWVTleauTD6v4QGPLwXbq53M23zHgyEensC8pRq4NZLjNWPgzBiQY+JIdDt3s/RDZeHdtL+egUJTxzw7pmD6Qli0aVhoKzBcDYsLPn3M5OGemGmFZVc0vCU6HuAk15t+2eMCTmunBw/Rz42S6fHKYEwp8FdYGo3mIqZQ7Clv3WnBEJ3g/VWXYoVM0ID1BMhDXdzkB6qM2PjUlUJnrgDsw/ewZiCTP4SgBwGt1puzLzMUo7D/mAlC9hAqU7VvkV2YmVeXfoKFw2HIIWrIxqcNqJ/1A==
X-MS-Exchange-CrossTenant-Network-Message-Id: f8c55470-713f-4a7e-93fb-08df16506869
X-MS-Exchange-CrossTenant-AuthSource: DS6PR11MB362586.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2026 13:17:51.5993
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: r8ckmtg0L7ZmWSinGeRSRFt3TxKtbJlbvGRX6MlMgLxgqgQyk+LBWjjOw/uZPDWlhn2lco8CRSRfnZ29HCJkRQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5111
X-OriginatorOrg: intel.com

On Sat, Sep 19, 2026 at 10:12:19PM +0900, Koichiro Den wrote:
> On Sat, Sep 19, 2026 at 05:40:55AM +0200, kernel test robot wrote:
> > BCC: lkp@intel.com
> > CC: oe-kbuild-all@lists.linux.dev
> > CC: linux-kernel@vger.kernel.org
> > TO: Koichiro Den <den@valinux.co.jp>
> > CC: Bjorn Helgaas <helgaas@kernel.org>
> > CC: Manivannan Sadhasivam <mani@kernel.org>
> > CC: Frank Li <Frank.Li@nxp.com>
> > 
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> > head:   40288c9206c17eb66a603262e06a58d300d0f279
> > commit: 8fda2dd209d34396cf49504e2c8dd55d182b14bc PCI: endpoint: pci-epf-test: Reuse pre-exposed doorbell targets
> > date:   5 months ago
> > :::::: branch date: 4 hours ago
> > :::::: commit date: 5 months ago
> > config: x86_64-randconfig-103-20260911 (https://download.01.org/0day-ci/archive/20260919/202609190509.163Y39lZ-lkp@intel.com/config)
> > compiler: gcc-13 (Debian 13.3.0-16) 13.3.0
> > 
> > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > the same patch/commit), kindly add following tags
> > | Fixes: 8fda2dd209d3 ("PCI: endpoint: pci-epf-test: Reuse pre-exposed doorbell targets")
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Reported-by: Julia Lawall <julia.lawall@inria.fr>
> > | Closes: https://lore.kernel.org/r/202609190509.163Y39lZ-lkp@intel.com/
> > 
> > cocci warnings: (new ones prefixed by >>)
> > >> drivers/pci/endpoint/functions/pci-epf-test.c:769:7-27: WARNING: Threaded IRQ with no primary handler requested without IRQF_ONESHOT (unless it is nested IRQ)
> 
> Same as reported in May:
> https://lore.kernel.org/r/yaedpcylplxx6wu5scgfsb47otlew6inqyvkkmdaspcqrziv4j@vbk7k4umw7gq/

Thanks for the info. BTW: this report is still waiting for further check as it sits on
oe-kbuild@lists.linux.dev and not yet send to any developer yet. So you can ignore it.

Thanks

> 
> Personally, I don't think either complicating irqf_oneshot.cocci to cover this
> case or adding a patch to pci-epf-test.c just to avoid this warning would be
> worthwhile. But if any action would be preferable from maintainers' perspective,
> please let me know.
> 
> Best regards,
> Koichiro
> 
> > 
> > vim +769 drivers/pci/endpoint/functions/pci-epf-test.c
> > 
> > eff0c286aa9162 Frank Li                  2025-07-10  731  
> > eff0c286aa9162 Frank Li                  2025-07-10  732  static void pci_epf_test_enable_doorbell(struct pci_epf_test *epf_test,
> > eff0c286aa9162 Frank Li                  2025-07-10  733  					 struct pci_epf_test_reg *reg)
> > eff0c286aa9162 Frank Li                  2025-07-10  734  {
> > eff0c286aa9162 Frank Li                  2025-07-10  735  	u32 status = le32_to_cpu(reg->status);
> > eff0c286aa9162 Frank Li                  2025-07-10  736  	struct pci_epf *epf = epf_test->epf;
> > 8fda2dd209d343 Koichiro Den              2026-04-14  737  	struct pci_epf_doorbell_msg *db;
> > eff0c286aa9162 Frank Li                  2025-07-10  738  	struct pci_epc *epc = epf->epc;
> > 8fda2dd209d343 Koichiro Den              2026-04-14  739  	unsigned long irq_flags;
> > eff0c286aa9162 Frank Li                  2025-07-10  740  	struct msi_msg *msg;
> > eff0c286aa9162 Frank Li                  2025-07-10  741  	enum pci_barno bar;
> > eff0c286aa9162 Frank Li                  2025-07-10  742  	size_t offset;
> > eff0c286aa9162 Frank Li                  2025-07-10  743  	int ret;
> > eff0c286aa9162 Frank Li                  2025-07-10  744  
> > eff0c286aa9162 Frank Li                  2025-07-10  745  	ret = pci_epf_alloc_doorbell(epf, 1);
> > eff0c286aa9162 Frank Li                  2025-07-10  746  	if (ret)
> > eff0c286aa9162 Frank Li                  2025-07-10  747  		goto set_status_err;
> > eff0c286aa9162 Frank Li                  2025-07-10  748  
> > 8fda2dd209d343 Koichiro Den              2026-04-14  749  	db = &epf->db_msg[0];
> > 8fda2dd209d343 Koichiro Den              2026-04-14  750  	msg = &db->msg;
> > 8fda2dd209d343 Koichiro Den              2026-04-14  751  	epf_test->db_bar_programmed = false;
> > 8fda2dd209d343 Koichiro Den              2026-04-14  752  
> > 8fda2dd209d343 Koichiro Den              2026-04-14  753  	if (db->bar != NO_BAR) {
> > 8fda2dd209d343 Koichiro Den              2026-04-14  754  		/*
> > 8fda2dd209d343 Koichiro Den              2026-04-14  755  		 * The doorbell target is already exposed via a platform-owned
> > 8fda2dd209d343 Koichiro Den              2026-04-14  756  		 * fixed BAR
> > 8fda2dd209d343 Koichiro Den              2026-04-14  757  		 */
> > 8fda2dd209d343 Koichiro Den              2026-04-14  758  		bar = db->bar;
> > 8fda2dd209d343 Koichiro Den              2026-04-14  759  		offset = db->offset;
> > 8fda2dd209d343 Koichiro Den              2026-04-14  760  	} else {
> > 8fda2dd209d343 Koichiro Den              2026-04-14  761  		bar = pci_epc_get_next_free_bar(epf_test->epc_features,
> > 8fda2dd209d343 Koichiro Den              2026-04-14  762  						epf_test->test_reg_bar + 1);
> > eff0c286aa9162 Frank Li                  2025-07-10  763  		if (bar < BAR_0)
> > eff0c286aa9162 Frank Li                  2025-07-10  764  			goto err_doorbell_cleanup;
> > 8fda2dd209d343 Koichiro Den              2026-04-14  765  	}
> > 8fda2dd209d343 Koichiro Den              2026-04-14  766  
> > 8fda2dd209d343 Koichiro Den              2026-04-14  767  	irq_flags = epf->db_msg[0].irq_flags | IRQF_ONESHOT;
> > eff0c286aa9162 Frank Li                  2025-07-10  768  
> > 25423cda145f9e Bhanu Seshu Kumar Valluri 2025-10-14 @769  	ret = request_threaded_irq(epf->db_msg[0].virq, NULL,
> > 8fda2dd209d343 Koichiro Den              2026-04-14  770  				   pci_epf_test_doorbell_handler, irq_flags,
> > eff0c286aa9162 Frank Li                  2025-07-10  771  				   "pci-ep-test-doorbell", epf_test);
> > eff0c286aa9162 Frank Li                  2025-07-10  772  	if (ret) {
> > eff0c286aa9162 Frank Li                  2025-07-10  773  		dev_err(&epf->dev,
> > eff0c286aa9162 Frank Li                  2025-07-10  774  			"Failed to request doorbell IRQ: %d\n",
> > eff0c286aa9162 Frank Li                  2025-07-10  775  			epf->db_msg[0].virq);
> > eff0c286aa9162 Frank Li                  2025-07-10  776  		goto err_doorbell_cleanup;
> > eff0c286aa9162 Frank Li                  2025-07-10  777  	}
> > eff0c286aa9162 Frank Li                  2025-07-10  778  
> > eff0c286aa9162 Frank Li                  2025-07-10  779  	reg->doorbell_data = cpu_to_le32(msg->data);
> > eff0c286aa9162 Frank Li                  2025-07-10  780  	reg->doorbell_bar = cpu_to_le32(bar);
> > eff0c286aa9162 Frank Li                  2025-07-10  781  
> > 8fda2dd209d343 Koichiro Den              2026-04-14  782  	if (db->bar == NO_BAR) {
> > 8fda2dd209d343 Koichiro Den              2026-04-14  783  		ret = pci_epf_align_inbound_addr(epf, bar,
> > 8fda2dd209d343 Koichiro Den              2026-04-14  784  						 ((u64)msg->address_hi << 32) |
> > 8fda2dd209d343 Koichiro Den              2026-04-14  785  						 msg->address_lo,
> > 8fda2dd209d343 Koichiro Den              2026-04-14  786  						 &epf_test->db_bar.phys_addr,
> > 8fda2dd209d343 Koichiro Den              2026-04-14  787  						 &offset);
> > eff0c286aa9162 Frank Li                  2025-07-10  788  
> > eff0c286aa9162 Frank Li                  2025-07-10  789  		if (ret)
> > e81fa70179aac6 Koichiro Den              2026-02-17  790  			goto err_free_irq;
> > 8fda2dd209d343 Koichiro Den              2026-04-14  791  	}
> > eff0c286aa9162 Frank Li                  2025-07-10  792  
> > eff0c286aa9162 Frank Li                  2025-07-10  793  	reg->doorbell_offset = cpu_to_le32(offset);
> > eff0c286aa9162 Frank Li                  2025-07-10  794  
> > 8fda2dd209d343 Koichiro Den              2026-04-14  795  	if (db->bar == NO_BAR) {
> > eff0c286aa9162 Frank Li                  2025-07-10  796  		epf_test->db_bar.barno = bar;
> > eff0c286aa9162 Frank Li                  2025-07-10  797  		epf_test->db_bar.size = epf->bar[bar].size;
> > eff0c286aa9162 Frank Li                  2025-07-10  798  		epf_test->db_bar.flags = epf->bar[bar].flags;
> > eff0c286aa9162 Frank Li                  2025-07-10  799  
> > eff0c286aa9162 Frank Li                  2025-07-10  800  		ret = pci_epc_set_bar(epc, epf->func_no, epf->vfunc_no, &epf_test->db_bar);
> > eff0c286aa9162 Frank Li                  2025-07-10  801  		if (ret)
> > e81fa70179aac6 Koichiro Den              2026-02-17  802  			goto err_free_irq;
> > eff0c286aa9162 Frank Li                  2025-07-10  803  
> > 8fda2dd209d343 Koichiro Den              2026-04-14  804  		epf_test->db_bar_programmed = true;
> > 8fda2dd209d343 Koichiro Den              2026-04-14  805  	}
> > 8fda2dd209d343 Koichiro Den              2026-04-14  806  
> > eff0c286aa9162 Frank Li                  2025-07-10  807  	status |= STATUS_DOORBELL_ENABLE_SUCCESS;
> > eff0c286aa9162 Frank Li                  2025-07-10  808  	reg->status = cpu_to_le32(status);
> > eff0c286aa9162 Frank Li                  2025-07-10  809  	return;
> > eff0c286aa9162 Frank Li                  2025-07-10  810  
> > e81fa70179aac6 Koichiro Den              2026-02-17  811  err_free_irq:
> > e81fa70179aac6 Koichiro Den              2026-02-17  812  	free_irq(epf->db_msg[0].virq, epf_test);
> > eff0c286aa9162 Frank Li                  2025-07-10  813  err_doorbell_cleanup:
> > eff0c286aa9162 Frank Li                  2025-07-10  814  	pci_epf_test_doorbell_cleanup(epf_test);
> > eff0c286aa9162 Frank Li                  2025-07-10  815  set_status_err:
> > eff0c286aa9162 Frank Li                  2025-07-10  816  	status |= STATUS_DOORBELL_ENABLE_FAIL;
> > eff0c286aa9162 Frank Li                  2025-07-10  817  	reg->status = cpu_to_le32(status);
> > eff0c286aa9162 Frank Li                  2025-07-10  818  }
> > eff0c286aa9162 Frank Li                  2025-07-10  819  
> > 
> > :::::: The code at line 769 was first introduced by commit
> > :::::: 25423cda145f9ed6ee4a72d9f2603ac2a4685e74 PCI: endpoint: pci-epf-test: Fix sleeping function being called from atomic context
> > 
> > :::::: TO: Bhanu Seshu Kumar Valluri <bhanuseshukumar@gmail.com>
> > :::::: CC: Manivannan Sadhasivam <mani@kernel.org>
> > 
> > --
> > 0-DAY CI Kernel Test Service
> > https://github.com/intel/lkp-tests/wiki
> 
