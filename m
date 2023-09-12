Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEAC33D70
	for <oe-kbuild@lists.linux.dev>; Tue, 12 Sep 2023 18:05:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694541947; x=1726077947;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=7oY3Izd8Dt4sfZhun1fM+6/TkqTywUqmQHa89bXhi/4=;
  b=I06RgA0z1vON7UOlONP6A5Zq11/j6795ExxbeLg73nMXzQTF7gb8w2yR
   ZKeDFHI7U5ky0M+Zzt+N+2lWnKMEL8TbAM6SZqpiAxG5WzP2iNd0vknIn
   J3MazRUID8gCJF/rfZGguABRNWsSNBsJ4PbLpFxblDRPe3lgzIf8NyYsG
   TMP1uXvnVKgYvFDBiDTX9ZwnTZ4pdwfhMn+Z8B9GEyZnmVsp/IEUi7P8r
   J1HJVcnnLxSd0Y84jeTD34yAzBZ5pvoBmCAFaqV3j/U3e/W1ANwcjT4pW
   o9HJVWEeQk2ktkafQqJ1zVmzVMcRtsILcO+yjgbymIAmM6i53yprh0H96
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10831"; a="377367990"
X-IronPort-AV: E=Sophos;i="6.02,139,1688454000"; 
   d="scan'208";a="377367990"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Sep 2023 11:05:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10831"; a="778899768"
X-IronPort-AV: E=Sophos;i="6.02,139,1688454000"; 
   d="scan'208";a="778899768"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
  by orsmga001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 12 Sep 2023 11:05:22 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Tue, 12 Sep 2023 11:05:22 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Tue, 12 Sep 2023 11:05:22 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.48) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Tue, 12 Sep 2023 11:05:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eHcHobdCLKZyl22nBJ9FY7uzVsUlnGvYuGTbDFpByxT3DZRZltBAsVo69pMfa9vYuIFiDShghtPPdVriWkw18n+edKWyK42MVrPwAR+lw77zGKlZEIxCeIciHcxVD2pckEVL+pfP3rTWQ1bRPWwxgPkdOkCKcy2CV07CXQ+XUa43BDd2ZTUh2CNAIp9SsJZkh79TnYmYOdWrEX5UPT4D7qs25YY+xgp0q9VZ4eT3Vae9iqiZwSIQ3yNX+2BGh6dW8o3ArOTcmz4SkdjRszT9hHeZWSfklOOkVzIyythE1fMcQjCEsPE8XNCiEnn7oQJ7tcc3D4ocbTmUN9BYK4xOhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yDLBenpYj/I0X4geAFrHOA0m8JKYyjLTpUWUzXMX/cg=;
 b=aQbDtgH+afCjcN3ARFCfncF1yrVX8GG8wxi51Qbkd92iqC88hyxkRrWA1l34wEi1ix/GqXRbR+bNnTyUKSBhhHzq/e+JlqnvS5DeOGt6JcMxclYqlw/gKt7Kp9t6Fs4N8BNWSi1wwUHmn8As3Kvb72rEafOxBL1HEDdFKXcoIZr5aYEeg0GWHpJGwDHpY9x99gN49wijMkMPDhU7GhjsG1PWsdHZZvwd5D2IbH7/9hM/UibukvwiJLq0jBPs7VJn+xnHjWL3eTUYFVN5vNensj5YwM1VgGJqxNzSPWzTsFMZMA5n4OIYBEFw7HYYZLbfOlAbGAlkRVwxn7EtFf4cLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6392.namprd11.prod.outlook.com (2603:10b6:930:37::15)
 by SJ0PR11MB4989.namprd11.prod.outlook.com (2603:10b6:a03:2d9::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.35; Tue, 12 Sep
 2023 18:05:19 +0000
Received: from CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::d35:d16b:4ee3:77e5]) by CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::d35:d16b:4ee3:77e5%7]) with mapi id 15.20.6768.029; Tue, 12 Sep 2023
 18:05:19 +0000
From: "Liu, Yujie" <yujie.liu@intel.com>
To: lkp <lkp@intel.com>, "oe-kbuild@lists.linux.dev"
	<oe-kbuild@lists.linux.dev>
Subject: RE: include/linux/gpio/consumer.h: linux/err.h is included more than
 once.
Thread-Topic: include/linux/gpio/consumer.h: linux/err.h is included more than
 once.
Thread-Index: AQHZ4GpCcAVx/RFgY0iyMFEMZ531wLAXhjqQ
Date: Tue, 12 Sep 2023 18:05:19 +0000
Message-ID: <CY5PR11MB639294C1D950C2E8C3DF2EE0FBF1A@CY5PR11MB6392.namprd11.prod.outlook.com>
References: <202309061013.msGjGr5T-lkp@intel.com>
In-Reply-To: <202309061013.msGjGr5T-lkp@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR11MB6392:EE_|SJ0PR11MB4989:EE_
x-ms-office365-filtering-correlation-id: 665087dd-73eb-4dfc-4360-08dbb3bad37f
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: fObvxSLaGR2HwUw/dqK7l4umt5Uw9ViVzCwpGjeN2451Giz3AKgYdoOj8cJLnkj+RCRXUMrUhzE4gBK0pkS+o4vuN0UBtZEHRGaARVkJSJtkVyGsEfcWwfqtiHyPxRkb/fa2pA99k1k3fLoWW1hKofu6/GI6pIoJizrZk9HMw07QZxQvuvtBDJLH+VVuJefu5KwhpSviq+q41/+NGe6OLm4WDgH+PFcUbvw3QIeJ7dZaMevTJcfSGzFmF9hEgR8Gu2niY/zT554g6CEBf/43C7dfE5vysZmM/+z3ZUelyd4MEmhCwixesQ5SXqlVM//+uLO9Hv0a1HQGkLnxGd8odq66sfsn5ommog4K3GNXSxqwzNjqDcYk6cxtgNh/SsZucT+ohQQgNcz4NUhVxk1nL/AlrMBDeg/uvXL44Kp/jSJUVDsD9bLxEYja+n8MzdYoGbPzfZ2S3JyfrEFWMvraShgUqVfKiNoTNRmzD89jLizO0z4iB9s9NQEal5/t00XCP4N6S6WSCLMY1Z2d58hgYbFkz8Yx8xhI+VpXckrnaa5/wzW77Wo4xbUkFWBX8brvG6EsNmeADflMBiQzzD335+hqraTZQ6acuRprQx9y6GIVbDt+79RywOWisp/5u/MpAsZ90HIpnpd07Yw9lYjONg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR11MB6392.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(376002)(136003)(346002)(366004)(39860400002)(186009)(1800799009)(451199024)(52536014)(55016003)(41300700001)(8936002)(8676002)(5660300002)(316002)(30864003)(110136005)(76116006)(33656002)(66476007)(66446008)(66946007)(86362001)(64756008)(66556008)(122000001)(2906002)(38070700005)(38100700002)(83380400001)(478600001)(71200400001)(7696005)(53546011)(9686003)(6506007)(966005)(82960400001)(26005);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?+K4ou2rrPGPYLkNyQK51tw2qneU2pYNgdaPDjmD0RjkFAsDXwS8zf9qQcwWV?=
 =?us-ascii?Q?5pRste5OX1g6WOVTayozomDu8RXHdkM8GrLkk+y6Hf9N2uMOKeSRxm8PW73Z?=
 =?us-ascii?Q?6bXEVUWE5RZbFJ/kyxW8W1oTS5YlgWsCQwPLEqXfj2NLQ84BSO5p9ygOz8hH?=
 =?us-ascii?Q?aXCcuooQrq6F8Dg8lMpzWLIsyk1Xi0TtHUcTa1s7vN9oWFs+uhb5IDCeA5be?=
 =?us-ascii?Q?7CFa0Yo9IM5Zcb7JYkYX/eqWYJA55o9caa0U5qOUI5GvmXTlKIv/vfWTqjrJ?=
 =?us-ascii?Q?PjxkwAxe2eiseHkS+vSeFJHVs3o8cM6RgTrcZc2gGIFplWEIEtSCvkhS1KHb?=
 =?us-ascii?Q?fZFS4dOqeIqY7LpjCqMKMBUMfjhR206xTAmsECfe7ksGAkxj/avOrQXl5uCD?=
 =?us-ascii?Q?jh8Occcixdyv/AcRsy+2EXaHYdujRxohJPePOF2MoeUaTn9Qa5Kx5ztF462I?=
 =?us-ascii?Q?4tvOt/wAlzLpiYqc1Oy34Bb1pFCU+vfwUgu7VtQB2OpdyLxlnrv5q9BFrHax?=
 =?us-ascii?Q?NmyttiZjOJ/SemINJk6EiLOkk14zc3UKRWftn1dYwSnsnNPjPlu+nZCqFZSO?=
 =?us-ascii?Q?BpIIDK3jmk3jQ8QThZeUXknmcXUjSKHK9w+bfE4BAhdjTR1K7jdhLwr3BJBK?=
 =?us-ascii?Q?XfV27ZqwOQS5mYf+yQimFfOG3sCt+NY3Gglch8adG1z9HwU6mFcJrb4yjbKt?=
 =?us-ascii?Q?pwHvjO/ziqidp7VsNIzRqwXSX/KQpX2FYSO33P8CuY7BRkY4VRSmhu1pL3Lz?=
 =?us-ascii?Q?C3uw0jzeYwXibNT822hIqjlmXuqRNYNDfHRIPu2Koahdnub8j6Mzvq8ozpB6?=
 =?us-ascii?Q?3gGPSrekpKJZauiWfBxG/N8qYXbxxOLiBWWcj8jtVdYXnoBdVYFHKNaXVyjh?=
 =?us-ascii?Q?S6k3ZlBIkU27aIYDsEd4hJKRScQ/RsAx29HN7d8hvbkgSQxXZjXkTfPPXXSI?=
 =?us-ascii?Q?MvlrFn3kIVykWJsN+TeMysq/8Rc0dliBVSQE7EbtxIXCXJHXzyoUgiUO0YS4?=
 =?us-ascii?Q?e0tWbTyyS0qdIPQtBCOmz9Cfk9HpMj6VlsUooi4O+0B3tPFtcP3bcOMRDuFa?=
 =?us-ascii?Q?6/No3IWSDrlp60l0328PONtylHplL+wZWbwDldnwLCNhWUThCLrP9w0NwOmX?=
 =?us-ascii?Q?WTYt9CnPmrneBhDPP2WJPQfr5CXiYo6Avro2eHI9Exjg1Ajk3VZ3TTi2AxV8?=
 =?us-ascii?Q?NQcbxmgb3il2QqGraar4+1XGZVKkKLipOOrS5mem/T/uhDL0UCyPzhi67RTK?=
 =?us-ascii?Q?JZhfSs6mTT9oZkejwkDRN68yE1qCVQbJDryla0f8rjgs/79wTWhRDSGHuy2N?=
 =?us-ascii?Q?0cUbJS2rH2bGXdotxpHE78SFeoeclySDKvctv5XNBjxX33OlZ26yaALJHoDq?=
 =?us-ascii?Q?x1eveZljiGMO3ZiEHtahs5sAfE5HJtMPonna/VAiMU1EHyGn2HykvINTCOz+?=
 =?us-ascii?Q?0HQvBcppEP+ayQWWdwhDfpbrdoEkyeDMIgPY688bOUnYgI8qUZmVYv3js6Rg?=
 =?us-ascii?Q?oNL5Fs2y5dF+psArd5EaJfDRkhGLYPDTOgsDb6dvD+sMsShGZMPqA1tp0ejB?=
 =?us-ascii?Q?6ZCYuRQBft1MehYNWnm8G7vVs9hKxmHci4RFAkVo?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 665087dd-73eb-4dfc-4360-08dbb3bad37f
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Sep 2023 18:05:19.6114
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: eDzGYclyBjOnJB/49ET6w48IWaL93MEc3M4xuP3OBeyP2Ffw8GZgrLZS/upcds3R2EsFNoSbjxhoLuzNeHBeMg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4989
X-OriginatorOrg: intel.com

not_reported "guarded by different #ifdef macros"

 > 187	#include <linux/err.h>
...
   619	#else  /* CONFIG_GPIOLIB && CONFIG_ACPI */
   620=09
 > 621	#include <linux/err.h>

-----Original Message-----
From: lkp <lkp@intel.com>=20
Sent: Wednesday, September 6, 2023 10:30
To: oe-kbuild@lists.linux.dev
Cc: lkp <lkp@intel.com>
Subject: include/linux/gpio/consumer.h: linux/err.h is included more than o=
nce.

::::::=20
:::::: Manual check reason: "low confidence bisect report"
::::::=20

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   65d6e954e37872fd9afb5ef3fc0481bb3c2f20f4
commit: 380c7ba3923c6e471aff0f951a6cf42e8dec2c79 gpiolib: Clean up headers
date:   6 months ago
:::::: branch date: 6 hours ago
:::::: commit date: 6 months ago
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230906/202309061013.m=
sGjGr5T-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202309061013.msGjGr5T-lkp@intel.com/

includecheck warnings: (new ones prefixed by >>)
>> include/linux/gpio/consumer.h: linux/err.h is included more than once.

vim +187 include/linux/gpio/consumer.h

   186=09
 > 187	#include <linux/err.h>
   188	#include <linux/kernel.h>
   189=09
   190	#include <asm/bug.h>
   191=09
   192	static inline int gpiod_count(struct device *dev, const char *con_id=
)
   193	{
   194		return 0;
   195	}
   196=09
   197	static inline struct gpio_desc *__must_check gpiod_get(struct device=
 *dev,
   198							       const char *con_id,
   199							       enum gpiod_flags flags)
   200	{
   201		return ERR_PTR(-ENOSYS);
   202	}
   203	static inline struct gpio_desc *__must_check
   204	gpiod_get_index(struct device *dev,
   205			const char *con_id,
   206			unsigned int idx,
   207			enum gpiod_flags flags)
   208	{
   209		return ERR_PTR(-ENOSYS);
   210	}
   211=09
   212	static inline struct gpio_desc *__must_check
   213	gpiod_get_optional(struct device *dev, const char *con_id,
   214			   enum gpiod_flags flags)
   215	{
   216		return NULL;
   217	}
   218=09
   219	static inline struct gpio_desc *__must_check
   220	gpiod_get_index_optional(struct device *dev, const char *con_id,
   221				 unsigned int index, enum gpiod_flags flags)
   222	{
   223		return NULL;
   224	}
   225=09
   226	static inline struct gpio_descs *__must_check
   227	gpiod_get_array(struct device *dev, const char *con_id,
   228			enum gpiod_flags flags)
   229	{
   230		return ERR_PTR(-ENOSYS);
   231	}
   232=09
   233	static inline struct gpio_descs *__must_check
   234	gpiod_get_array_optional(struct device *dev, const char *con_id,
   235				 enum gpiod_flags flags)
   236	{
   237		return NULL;
   238	}
   239=09
   240	static inline void gpiod_put(struct gpio_desc *desc)
   241	{
   242		might_sleep();
   243=09
   244		/* GPIO can never have been requested */
   245		WARN_ON(desc);
   246	}
   247=09
   248	static inline void devm_gpiod_unhinge(struct device *dev,
   249					      struct gpio_desc *desc)
   250	{
   251		might_sleep();
   252=09
   253		/* GPIO can never have been requested */
   254		WARN_ON(desc);
   255	}
   256=09
   257	static inline void gpiod_put_array(struct gpio_descs *descs)
   258	{
   259		might_sleep();
   260=09
   261		/* GPIO can never have been requested */
   262		WARN_ON(descs);
   263	}
   264=09
   265	static inline struct gpio_desc *__must_check
   266	devm_gpiod_get(struct device *dev,
   267			 const char *con_id,
   268			 enum gpiod_flags flags)
   269	{
   270		return ERR_PTR(-ENOSYS);
   271	}
   272	static inline
   273	struct gpio_desc *__must_check
   274	devm_gpiod_get_index(struct device *dev,
   275			       const char *con_id,
   276			       unsigned int idx,
   277			       enum gpiod_flags flags)
   278	{
   279		return ERR_PTR(-ENOSYS);
   280	}
   281=09
   282	static inline struct gpio_desc *__must_check
   283	devm_gpiod_get_optional(struct device *dev, const char *con_id,
   284				  enum gpiod_flags flags)
   285	{
   286		return NULL;
   287	}
   288=09
   289	static inline struct gpio_desc *__must_check
   290	devm_gpiod_get_index_optional(struct device *dev, const char *con_id=
,
   291					unsigned int index, enum gpiod_flags flags)
   292	{
   293		return NULL;
   294	}
   295=09
   296	static inline struct gpio_descs *__must_check
   297	devm_gpiod_get_array(struct device *dev, const char *con_id,
   298			     enum gpiod_flags flags)
   299	{
   300		return ERR_PTR(-ENOSYS);
   301	}
   302=09
   303	static inline struct gpio_descs *__must_check
   304	devm_gpiod_get_array_optional(struct device *dev, const char *con_id=
,
   305				      enum gpiod_flags flags)
   306	{
   307		return NULL;
   308	}
   309=09
   310	static inline void devm_gpiod_put(struct device *dev, struct gpio_de=
sc *desc)
   311	{
   312		might_sleep();
   313=09
   314		/* GPIO can never have been requested */
   315		WARN_ON(desc);
   316	}
   317=09
   318	static inline void devm_gpiod_put_array(struct device *dev,
   319						struct gpio_descs *descs)
   320	{
   321		might_sleep();
   322=09
   323		/* GPIO can never have been requested */
   324		WARN_ON(descs);
   325	}
   326=09
   327=09
   328	static inline int gpiod_get_direction(const struct gpio_desc *desc)
   329	{
   330		/* GPIO can never have been requested */
   331		WARN_ON(desc);
   332		return -ENOSYS;
   333	}
   334	static inline int gpiod_direction_input(struct gpio_desc *desc)
   335	{
   336		/* GPIO can never have been requested */
   337		WARN_ON(desc);
   338		return -ENOSYS;
   339	}
   340	static inline int gpiod_direction_output(struct gpio_desc *desc, int=
 value)
   341	{
   342		/* GPIO can never have been requested */
   343		WARN_ON(desc);
   344		return -ENOSYS;
   345	}
   346	static inline int gpiod_direction_output_raw(struct gpio_desc *desc,=
 int value)
   347	{
   348		/* GPIO can never have been requested */
   349		WARN_ON(desc);
   350		return -ENOSYS;
   351	}
   352	static inline int gpiod_enable_hw_timestamp_ns(struct gpio_desc *des=
c,
   353						       unsigned long flags)
   354	{
   355		WARN_ON(desc);
   356		return -ENOSYS;
   357	}
   358	static inline int gpiod_disable_hw_timestamp_ns(struct gpio_desc *de=
sc,
   359							unsigned long flags)
   360	{
   361		WARN_ON(desc);
   362		return -ENOSYS;
   363	}
   364	static inline int gpiod_get_value(const struct gpio_desc *desc)
   365	{
   366		/* GPIO can never have been requested */
   367		WARN_ON(desc);
   368		return 0;
   369	}
   370	static inline int gpiod_get_array_value(unsigned int array_size,
   371						struct gpio_desc **desc_array,
   372						struct gpio_array *array_info,
   373						unsigned long *value_bitmap)
   374	{
   375		/* GPIO can never have been requested */
   376		WARN_ON(desc_array);
   377		return 0;
   378	}
   379	static inline void gpiod_set_value(struct gpio_desc *desc, int value=
)
   380	{
   381		/* GPIO can never have been requested */
   382		WARN_ON(desc);
   383	}
   384	static inline int gpiod_set_array_value(unsigned int array_size,
   385						struct gpio_desc **desc_array,
   386						struct gpio_array *array_info,
   387						unsigned long *value_bitmap)
   388	{
   389		/* GPIO can never have been requested */
   390		WARN_ON(desc_array);
   391		return 0;
   392	}
   393	static inline int gpiod_get_raw_value(const struct gpio_desc *desc)
   394	{
   395		/* GPIO can never have been requested */
   396		WARN_ON(desc);
   397		return 0;
   398	}
   399	static inline int gpiod_get_raw_array_value(unsigned int array_size,
   400						    struct gpio_desc **desc_array,
   401						    struct gpio_array *array_info,
   402						    unsigned long *value_bitmap)
   403	{
   404		/* GPIO can never have been requested */
   405		WARN_ON(desc_array);
   406		return 0;
   407	}
   408	static inline void gpiod_set_raw_value(struct gpio_desc *desc, int v=
alue)
   409	{
   410		/* GPIO can never have been requested */
   411		WARN_ON(desc);
   412	}
   413	static inline int gpiod_set_raw_array_value(unsigned int array_size,
   414						    struct gpio_desc **desc_array,
   415						    struct gpio_array *array_info,
   416						    unsigned long *value_bitmap)
   417	{
   418		/* GPIO can never have been requested */
   419		WARN_ON(desc_array);
   420		return 0;
   421	}
   422=09
   423	static inline int gpiod_get_value_cansleep(const struct gpio_desc *d=
esc)
   424	{
   425		/* GPIO can never have been requested */
   426		WARN_ON(desc);
   427		return 0;
   428	}
   429	static inline int gpiod_get_array_value_cansleep(unsigned int array_=
size,
   430					     struct gpio_desc **desc_array,
   431					     struct gpio_array *array_info,
   432					     unsigned long *value_bitmap)
   433	{
   434		/* GPIO can never have been requested */
   435		WARN_ON(desc_array);
   436		return 0;
   437	}
   438	static inline void gpiod_set_value_cansleep(struct gpio_desc *desc, =
int value)
   439	{
   440		/* GPIO can never have been requested */
   441		WARN_ON(desc);
   442	}
   443	static inline int gpiod_set_array_value_cansleep(unsigned int array_=
size,
   444						    struct gpio_desc **desc_array,
   445						    struct gpio_array *array_info,
   446						    unsigned long *value_bitmap)
   447	{
   448		/* GPIO can never have been requested */
   449		WARN_ON(desc_array);
   450		return 0;
   451	}
   452	static inline int gpiod_get_raw_value_cansleep(const struct gpio_des=
c *desc)
   453	{
   454		/* GPIO can never have been requested */
   455		WARN_ON(desc);
   456		return 0;
   457	}
   458	static inline int gpiod_get_raw_array_value_cansleep(unsigned int ar=
ray_size,
   459						       struct gpio_desc **desc_array,
   460						       struct gpio_array *array_info,
   461						       unsigned long *value_bitmap)
   462	{
   463		/* GPIO can never have been requested */
   464		WARN_ON(desc_array);
   465		return 0;
   466	}
   467	static inline void gpiod_set_raw_value_cansleep(struct gpio_desc *de=
sc,
   468							int value)
   469	{
   470		/* GPIO can never have been requested */
   471		WARN_ON(desc);
   472	}
   473	static inline int gpiod_set_raw_array_value_cansleep(unsigned int ar=
ray_size,
   474							struct gpio_desc **desc_array,
   475							struct gpio_array *array_info,
   476							unsigned long *value_bitmap)
   477	{
   478		/* GPIO can never have been requested */
   479		WARN_ON(desc_array);
   480		return 0;
   481	}
   482=09
   483	static inline int gpiod_set_config(struct gpio_desc *desc, unsigned =
long config)
   484	{
   485		/* GPIO can never have been requested */
   486		WARN_ON(desc);
   487		return -ENOSYS;
   488	}
   489=09
   490	static inline int gpiod_set_debounce(struct gpio_desc *desc, unsigne=
d int debounce)
   491	{
   492		/* GPIO can never have been requested */
   493		WARN_ON(desc);
   494		return -ENOSYS;
   495	}
   496=09
   497	static inline int gpiod_set_transitory(struct gpio_desc *desc, bool =
transitory)
   498	{
   499		/* GPIO can never have been requested */
   500		WARN_ON(desc);
   501		return -ENOSYS;
   502	}
   503=09
   504	static inline void gpiod_toggle_active_low(struct gpio_desc *desc)
   505	{
   506		/* GPIO can never have been requested */
   507		WARN_ON(desc);
   508	}
   509=09
   510	static inline int gpiod_is_active_low(const struct gpio_desc *desc)
   511	{
   512		/* GPIO can never have been requested */
   513		WARN_ON(desc);
   514		return 0;
   515	}
   516	static inline int gpiod_cansleep(const struct gpio_desc *desc)
   517	{
   518		/* GPIO can never have been requested */
   519		WARN_ON(desc);
   520		return 0;
   521	}
   522=09
   523	static inline int gpiod_to_irq(const struct gpio_desc *desc)
   524	{
   525		/* GPIO can never have been requested */
   526		WARN_ON(desc);
   527		return -EINVAL;
   528	}
   529=09
   530	static inline int gpiod_set_consumer_name(struct gpio_desc *desc,
   531						  const char *name)
   532	{
   533		/* GPIO can never have been requested */
   534		WARN_ON(desc);
   535		return -EINVAL;
   536	}
   537=09
   538	static inline struct gpio_desc *gpio_to_desc(unsigned gpio)
   539	{
   540		return NULL;
   541	}
   542=09
   543	static inline int desc_to_gpio(const struct gpio_desc *desc)
   544	{
   545		/* GPIO can never have been requested */
   546		WARN_ON(desc);
   547		return -EINVAL;
   548	}
   549=09
   550	static inline
   551	struct gpio_desc *fwnode_gpiod_get_index(struct fwnode_handle *fwnod=
e,
   552						 const char *con_id, int index,
   553						 enum gpiod_flags flags,
   554						 const char *label)
   555	{
   556		return ERR_PTR(-ENOSYS);
   557	}
   558=09
   559	static inline
   560	struct gpio_desc *devm_fwnode_gpiod_get_index(struct device *dev,
   561						      struct fwnode_handle *fwnode,
   562						      const char *con_id, int index,
   563						      enum gpiod_flags flags,
   564						      const char *label)
   565	{
   566		return ERR_PTR(-ENOSYS);
   567	}
   568=09
   569	#endif /* CONFIG_GPIOLIB */
   570=09
   571	static inline
   572	struct gpio_desc *devm_fwnode_gpiod_get(struct device *dev,
   573						struct fwnode_handle *fwnode,
   574						const char *con_id,
   575						enum gpiod_flags flags,
   576						const char *label)
   577	{
   578		return devm_fwnode_gpiod_get_index(dev, fwnode, con_id, 0,
   579						   flags, label);
   580	}
   581=09
   582	struct acpi_gpio_params {
   583		unsigned int crs_entry_index;
   584		unsigned int line_index;
   585		bool active_low;
   586	};
   587=09
   588	struct acpi_gpio_mapping {
   589		const char *name;
   590		const struct acpi_gpio_params *data;
   591		unsigned int size;
   592=09
   593	/* Ignore IoRestriction field */
   594	#define ACPI_GPIO_QUIRK_NO_IO_RESTRICTION	BIT(0)
   595	/*
   596	 * When ACPI GPIO mapping table is in use the index parameter inside=
 it
   597	 * refers to the GPIO resource in _CRS method. That index has no
   598	 * distinction of actual type of the resource. When consumer wants t=
o
   599	 * get GpioIo type explicitly, this quirk may be used.
   600	 */
   601	#define ACPI_GPIO_QUIRK_ONLY_GPIOIO		BIT(1)
   602	/* Use given pin as an absolute GPIO number in the system */
   603	#define ACPI_GPIO_QUIRK_ABSOLUTE_NUMBER		BIT(2)
   604=09
   605		unsigned int quirks;
   606	};
   607=09
   608	#if IS_ENABLED(CONFIG_GPIOLIB) && IS_ENABLED(CONFIG_ACPI)
   609=09
   610	int acpi_dev_add_driver_gpios(struct acpi_device *adev,
   611				      const struct acpi_gpio_mapping *gpios);
   612	void acpi_dev_remove_driver_gpios(struct acpi_device *adev);
   613=09
   614	int devm_acpi_dev_add_driver_gpios(struct device *dev,
   615					   const struct acpi_gpio_mapping *gpios);
   616=09
   617	struct gpio_desc *acpi_get_and_request_gpiod(char *path, unsigned in=
t pin, char *label);
   618=09
   619	#else  /* CONFIG_GPIOLIB && CONFIG_ACPI */
   620=09
 > 621	#include <linux/err.h>
   622=09

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

