Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2121.outbound.protection.outlook.com [40.107.113.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 295933C05;
	Thu, 14 Sep 2023 23:03:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VBMohqqiK9iXl834ftQKD1ovRVRDTds4guZcGCkSnVw9ZgH/tja/HQg2Zrcu8XQK9xxI7lds352nTsX27tR59PtIU8P5TsHZ7PR68BVPNXsGR2n/XBBYE486bRphTvrBhqwhHsBwK6VacnYl7dM4/cZK4+0lU5PG/d/xAvzm6Q97uoUlsjtiNrluhRaL95JaEaiOktNBAeOyV62ma4HfSsYQapwKqPbqNlXghADNjvsWK6JVxEaEveaG55hiMlvsvZgXhceBocyYRm2GIwHgI8GfqsAe6dcOSX0rb0AQU+c9JLeaTQpGWXAwtyjs6Agqn1n+Z/SA5qIbk6xFoRCgdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BH7ZyEvZsELhwNcRnYIcQ03JcehnIffrDd3qtpUus24=;
 b=F6cQvsLddmbsxgrg7oBtXTKL5/zaFEaLoPIHHcsWK9n0hAkMUEcCGFWsIK27WGrgOLksXhwpUK9ZHOLKxtBw+8iPUrJ1iuGIRotZvro1drNMo5tlfbOxnswDLNoY2QwclxCu6slzgVhlQDcSDRc4iU6aBfvN0JISTCXVQEwBTqoNRyg5689QYwGsUEWxx2czyRHm9nxlkh6kMyHPl+/JUNte5v28NIjhjCAZ1JcH3gr3HuP4TGXneJiL3nCtFhQNfxW9XLPs1zdyOV+G/0w3qMnzx9PLgE6ZPXHED1snySyaZ5itxU2LC7So5oUFN3DguL6ciIK24+ScQbh/3FMY1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BH7ZyEvZsELhwNcRnYIcQ03JcehnIffrDd3qtpUus24=;
 b=EUPMfzIBGFGIRA+xsKExuhQYUfFm54X7c69AeBX5bsKRF0vaMRTswsRzC+dITYgJcA/LS6+xi1S7qrQg5Z22cbio7MddrkUe9F3ON2HRitRpGquXa8mnsP3+17u6O+7+vsiCJmsfvt4RpEuNyYFZchXoMz9p0Dk4uSaLqffJA5U=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYWPR01MB12103.jpnprd01.prod.outlook.com (2603:1096:400:446::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.21; Thu, 14 Sep
 2023 23:03:24 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::8c08:d94c:8e54:9b5d]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::8c08:d94c:8e54:9b5d%6]) with mapi id 15.20.6792.021; Thu, 14 Sep 2023
 23:03:24 +0000
Message-ID: <871qf0qrwk.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: oe-kbuild@lists.linux.dev,
	lkp@intel.com,
	oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 25/54] ASoC: generic: convert not to use asoc_xxx()
In-Reply-To: <3a818c96-8056-44ea-bc62-7104606da2ed@kadam.mountain>
References: <87h6o0qnho.wl-kuninori.morimoto.gx@renesas.com>
	<3a818c96-8056-44ea-bc62-7104606da2ed@kadam.mountain>
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 14 Sep 2023 23:03:23 +0000
X-ClientProxiedBy: TYAPR01CA0070.jpnprd01.prod.outlook.com
 (2603:1096:404:2b::34) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYWPR01MB12103:EE_
X-MS-Office365-Filtering-Correlation-Id: efc0887f-90eb-4217-708d-08dbb576cc23
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	vXwLs2fjepoDI1zllrn0TDHqwpJ1mFLsjRcP9Pbb3omGi5g76ASRFFM4kX+PLHhEce0eiojPfbRVg4RIOnQvKP83Mtl+MFn7hP5zmmoBYBCNKvs7prpCGxP19b8RM4K1csqFhcsh1Z+rulvk62NNC/mYc5ver7ldx2JCs8EVMyY5GGKJPTONrfw6XtMJZub92RXFkQFJ44k73iKAN8mRnR/2lKcMcqAvgkgJqyP7II3kuhqOfk828uYB2yoRMVpF1igG2COI6uFJtMPG1K+gE7lZG/la+dh/ag+rtgtmCb9ytExZ9iwOQiLXTtO2Ddwa0Sq5X2ZEOxfuBzteEztu8flGKJnjjDV9CHNOg1m8YD1KCCA00Lrq4fyEIjtrSPKF5rpQXvMdLP/chT/PFEWrWrJEbQUERA+UUOOEbwqC7eqK4eN7Jww9HySKY8qcGzdhEmUv0eIl3rx+DC+f2DR1GxapzB+XPq57sXf8Xu1NPEgkxfO4dAlYP+KrI44gNI1+royzZ0OKx8Myn6esE/A0B3NyJcK3GNcuWtMTo7cKhlm+FLNLDv+LqD/ZQcvxhQD2xcAHtsJkIlA3UUByIZllKgj9GZyLzW4FmhdNMy2PkLyAFAa6aWYgDqsNJYyRkDPhmkK8CrzxSkzIn+SmbMs21Q==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(39860400002)(376002)(346002)(396003)(136003)(186009)(1800799009)(451199024)(86362001)(36756003)(478600001)(38350700002)(38100700002)(4001150100001)(26005)(2906002)(2616005)(5660300002)(4326008)(41300700001)(6512007)(52116002)(6506007)(6486002)(66946007)(66556008)(316002)(66476007)(8676002)(6916009)(8936002)(41533002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?QmySYHrxxOVgkc2DTUxi6MWVFlzJvaEWRgqv2MJy9JQ+xYMlA38Tn3ekVH0T?=
 =?us-ascii?Q?9eg53tbNHBSkop/3l2GdumQcmCQgw3fIPEzlkCy/yunLbXSzWIE2gnGMthV8?=
 =?us-ascii?Q?shTVe0GroP9yfhXvwFA3TED0JLou5RYnQXM5LLCTsCBUpa7DlGqX2LBNQabf?=
 =?us-ascii?Q?en36EBN/pw++dAOf0H4onBN04VqLxs6QYDNCCPv6aLWxv0RooVZ2S3OWCXHe?=
 =?us-ascii?Q?FC5DjSoezcTgHUDAKMu8BbdFh/WCskZW1co2Q1f9veoy8JwAS5JdBYL9Ri0g?=
 =?us-ascii?Q?nmt7jXDih5e4NZzVZ0t52teGJ6e+FROCM6uvaJuiZJ0L5lOkGfYbmQCDMvCG?=
 =?us-ascii?Q?ceyo3JW+TAQMIDHVEnlC9fAEk0H/fyCGrNWqqoF7YknzxmgfxmsxPNBPXfs0?=
 =?us-ascii?Q?pBdhxdciFC+iBAs98+E2NWbDnaSIg+hlfcyCOdXXgPR0nsXc+sypdME4fDMq?=
 =?us-ascii?Q?WQ3fEB/5EYW7mrP+PaTb/UQx0HagVZMaxTA+7MIdzvLtCkw1bmFg3n/+RLud?=
 =?us-ascii?Q?zOyOEduD/uRBfBsnyHBcFOpEoFQ3wUroc22ginC4Opsl3+f2Q/g6fDQHnAcq?=
 =?us-ascii?Q?7GuSUrlc9sjR2RfeIv9gUs6pxocmO6EJQ5kHhlfSHnA61hGWIVLU3kYCBtsu?=
 =?us-ascii?Q?bixc1807XzQixAKTfQ4WYYbbd86TilfAr6DcGRJUj03gjsZBiGKAQHzdz6jZ?=
 =?us-ascii?Q?QtgbPTqq8ZA0nT9bIhWayNk2rR1DwRWUaxaqaeQnkJTGPA/wXTZIUoh72uYx?=
 =?us-ascii?Q?YztreSGX1VgZMotMveBj8uCHvUamrw6GcKTTMdngNSZu4A75uoewaapaB9lk?=
 =?us-ascii?Q?M0gTlnU4sr5QmU5jkzXSQjUrKdrmFYZ3LcevQK1X0y68E/uUxk74lZy6Rktm?=
 =?us-ascii?Q?bTnWMq2bwy5LKINoHVUkvPcST6SMLL8Tp5tdVGGnJ7XNLRlVcbOOjETRY0kV?=
 =?us-ascii?Q?fOHDJKwNQEi+3cDv+zg1Mwt5Bj1MpTd6KSjnUuIhEDP2s5nQLaib1/XPOVqY?=
 =?us-ascii?Q?qkiiMC+dt+drrHFB7mYdSJQ0WatRF3YggCp948AkrIBhsq3peNYph4XG97xN?=
 =?us-ascii?Q?LKWksfG/3dZI53cf7SIBAXAgiwcSVcDBZB5UCE9NuFyHY3GEFqpYiE/rkNXC?=
 =?us-ascii?Q?/bFSrZZ5mfpozxyezikS+SgBdsvaTYRaVOJIfsqQzLYXPqOnO4iTKmnsoDRw?=
 =?us-ascii?Q?NScLH+m++RtVmIb4EnNDUHv3MnrVkCa6N6kAm7XtUQZlozhZrEUusoi0wzNd?=
 =?us-ascii?Q?/SRnPxYAzrDVmrXJZze9IDSoxku78GLcdqYYGbeBsDuOnVCPVkDOYgjJrpbU?=
 =?us-ascii?Q?ndIZzrPhfA2g3V4t3QDXVTL69BAkXc4LkQrSj0PjwA7y/hmsuhwWU0QpIcgV?=
 =?us-ascii?Q?4+wzeE+5e/kD2w0C0SESZJAozYUoS1gNSBcPIYea96psBu6FFx79V3MLVvV+?=
 =?us-ascii?Q?cdrkPhjrsCgk9+U0eSYSMeUhkMiyquQPRtUYCHxBDIruJ65f4OF3P1lLnkNY?=
 =?us-ascii?Q?k2QT6yrS5RioXNZrb1sH6eGAdlTsLQWmB6vXPwirmY+6MZljbYPAMWRIAQJr?=
 =?us-ascii?Q?repQ6VkUDS6VW+GCatDvLQt7xW2L1YY6V3hVlDVYXX52P9lFqFx8qHBtpDMC?=
 =?us-ascii?Q?/VCzuFwzRujn9mTNjoarEv0=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: efc0887f-90eb-4217-708d-08dbb576cc23
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2023 23:03:23.9762
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Nu4QhiMAc/bpFErjAujTUJvxe4PBceetZAx9q6NeHIZelIR/XUlMVhmlETe69GC9BrVkHzV/rRNNVc/QAAQZZk5H7RL//8xOMsKzh5wKPKAPEBgYB8oIqQTb5osa3FIJ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB12103


Hi Dan

Thank you for the report

> fa558c2801fc17 Kuninori Morimoto   2013-11-20  753  	} else {
> 88c819af51a9cc Kuninori Morimoto   2023-09-11  754  		struct simple_util_info *cinfo;
> f107294c6422e7 Kuninori Morimoto   2019-06-06  755  		struct snd_soc_dai_link_component *cpus;
> 710af9196ce614 Kuninori Morimoto   2018-08-31  756  		struct snd_soc_dai_link_component *codecs;
> e58f41e41185c6 Kuninori Morimoto   2018-08-31  757  		struct snd_soc_dai_link_component *platform;
> 65a5056b21202e Kuninori Morimoto   2019-03-20  758  		struct snd_soc_dai_link *dai_link = priv->dai_link;
> 65a5056b21202e Kuninori Morimoto   2019-03-20  759  		struct simple_dai_props *dai_props = priv->dai_props;
> 65a5056b21202e Kuninori Morimoto   2019-03-20  760  
> ca65b492c7a265 Jean-Francois Moine 2014-01-15  761  		cinfo = dev->platform_data;
> ca65b492c7a265 Jean-Francois Moine 2014-01-15  762  		if (!cinfo) {
> f89983ef61677a Kuninori Morimoto   2012-12-25  763  			dev_err(dev, "no info for asoc-simple-card\n");
> f2390880ec0264 Kuninori Morimoto   2012-04-08  764  			return -EINVAL;
> 
> goto err?
> 
> f2390880ec0264 Kuninori Morimoto   2012-04-08  765  		}
> f2390880ec0264 Kuninori Morimoto   2012-04-08  766  
> f2390880ec0264 Kuninori Morimoto   2012-04-08  767  		if (!cinfo->name ||
> fa558c2801fc17 Kuninori Morimoto   2013-11-20  768  		    !cinfo->codec_dai.name ||
> 7722f830a45f7f Jean-Francois Moine 2014-01-15  769  		    !cinfo->codec ||
> 7722f830a45f7f Jean-Francois Moine 2014-01-15  770  		    !cinfo->platform ||
> 7722f830a45f7f Jean-Francois Moine 2014-01-15  771  		    !cinfo->cpu_dai.name) {
> 88c819af51a9cc Kuninori Morimoto   2023-09-11  772  			dev_err(dev, "insufficient simple_util_info settings\n");
> f2390880ec0264 Kuninori Morimoto   2012-04-08 @773  			return -EINVAL;
> 
> goto err?

Thank you for pointing it, but it is correct.
This driver is supporting both "DT sytle" and "platform data style"
and "DT style" error only need to use "goto err".

It is a little bit confusable place.

Thank you for your help !!

Best regards
---
Kuninori Morimoto
