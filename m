Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2128.outbound.protection.outlook.com [40.107.114.128])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F300180;
	Tue, 19 Sep 2023 00:19:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N9YTOvn97Fbr5YiGGkMq12ZeCgLiIQojnjx6fLla63b5lWEVovv0NR9Y7dLRxElQgJ02liez8CoN2/hioiVoA3sIkZrRTpunc2L46ZG9ZwVXCPvOMODqw0EYREQS3FOBXb4xO17kwnjeLQEKrgWGffqvTZ+w+lUYRDkD5ZXFEzl+9EBWktSeSpCeo1ffuPz0FUwIhyoaEY9dwyF/rYYBIrDhabR14NP0XTNXkCbS6B7yQt3JsxFKP68oJWKtFSdfHxNnC7e8zycFn0IleV/GYiM9xo2ERWVcvRL+4m+SeAorrsSRy1j3WMi3sAAzvj7DzGlNuSbcjvq6LN88ZKCEXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VDpsjPlf//Xm9qy6jNM8SzR6esKOl6o8iweBo6Bh1Cc=;
 b=bz/PIy1xpn0NZCB9bEH1SGUWN9SKlyuTLNZoTZy1dsh7/NVG39pkFV9ds0JvpA0/Tp8DpUj0jg9oGoIet4A7E1Llq2IZuauQnVHpMEirTbttAqhsiK46s0tGNo45Sd9i25jCcbwX3SfgIz8ih6O11yVQ4TTxtCfgtaXjjmqw5IhNYiqqNYKLoceZJ53AOPPiAUIZBDvurscVbvzazM4/RHHn07o/WF0IYo+cpS9iajLrYYjjRHis2i6p4o4UH1FiYmz21FNvo+DzQAjtDJhfDnGK3yk8UYxcorYVvCF6z7Hc+9vEkPGGJpm6vHO6EmQXAWGyLlsmNeuhp0ab6vO/sA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VDpsjPlf//Xm9qy6jNM8SzR6esKOl6o8iweBo6Bh1Cc=;
 b=HD8trU4+huE3TBmGTmliG+JBEyaRxi4hkVI8ydpMYsum3alSKAfMiBnAjimRgepV2Wh2a1C8YFurDwv4mOpUvseedhNbteh/2f7ZU9jCSZ7U01NS+wLG+7lv9bkp9fnswLSlf0RoLeKg06bgR39hJO39zvP4+ShcQqHMoDGnHSI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by OSZPR01MB8629.jpnprd01.prod.outlook.com (2603:1096:604:187::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.27; Tue, 19 Sep
 2023 00:19:13 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::8c08:d94c:8e54:9b5d]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::8c08:d94c:8e54:9b5d%6]) with mapi id 15.20.6792.026; Tue, 19 Sep 2023
 00:19:13 +0000
Message-ID: <87zg1j6mm6.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: oe-kbuild@lists.linux.dev,
	lkp@intel.com,
	oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 25/54] ASoC: generic: convert not to use asoc_xxx()
In-Reply-To: <f8790567-237c-4424-b185-9862a168c91d@kadam.mountain>
References: <87h6o0qnho.wl-kuninori.morimoto.gx@renesas.com>
	<3a818c96-8056-44ea-bc62-7104606da2ed@kadam.mountain>
	<871qf0qrwk.wl-kuninori.morimoto.gx@renesas.com>
	<f8790567-237c-4424-b185-9862a168c91d@kadam.mountain>
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 19 Sep 2023 00:19:13 +0000
X-ClientProxiedBy: TYAPR04CA0023.apcprd04.prod.outlook.com
 (2603:1096:404:15::35) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|OSZPR01MB8629:EE_
X-MS-Office365-Filtering-Correlation-Id: 146fbac0-4f11-4cc1-aae4-08dbb8a60d99
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	MiyUB6zoit5Cz+6T3rlZZ9rH4w5UJKJuvShzBaIg8/NE10NFq5fzEGo8tTyNSIh9Rsry0qUdJqAJmPiWY/GNIbjzpDYG2U6Q3GFTVUr/9E1ZO8bDaazF5oTjCbAH6cpnNeKXv5FTNY2d5XGzDqhml+ghqZG9hE3SntfkDIiZq89h56kc5axfi4Bf2MUpeFVhIdBGAWcKWqRub0FHeuYgzWR2jC9bJuZL91DzYvZ1F1o+dFmRWmmqbApehb50tx5sEfE+m/o1IQs29vsEmBUdsx+vln5ZJNBqBu3YnrbytL9AXJzrZ2KCi6/gadJWfsIS28HdE33w/Vfvcs/lRMwBA9BI9YacQuJB0hukFvObZZJndsKPqL0sQ+1zVqmqmdnD9ExdFWHI5Q9PNcvA7+E+dKzNh8HXcHFml/FrnCIYKXnwcN7r9/WQPSUfSewYaeeDQCITEghEN47SoidxEdaGuu2SE6Pva9K9kF9aAIV6VDyCMYFuA344xKLlYblkWOwLWrtUGnJfOvCfJLzTMqQAw/cTmEzHQn2ah01MftTWFf9L2gCbD+MX7SSfvMBTwXfWfdKr5nJAQBkzhBrl/GrKE3qgeKQ8isFxJDAIui8xEo/VQEZXG44w7h19Lr7lOJd1S63hhxgjz8KG96gX+gVhKg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(376002)(136003)(396003)(366004)(346002)(451199024)(1800799009)(186009)(36756003)(6486002)(6506007)(478600001)(26005)(86362001)(316002)(83380400001)(5660300002)(2906002)(2616005)(6512007)(6916009)(66946007)(52116002)(41300700001)(66556008)(66476007)(8676002)(8936002)(4326008)(38350700002)(38100700002)(41533002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?F9eK3eovuqZnDB5vqKbQBgFFSd4L0SUy03f2fxGwix5OD3hQPf5HnYsdLmPO?=
 =?us-ascii?Q?awFx2bhUa1yV4z8vuMq0IVPxzlOk+COEIl2WHsmSBslBepT1fApNwdCFsOE5?=
 =?us-ascii?Q?rEy/N99YBQuff3pxIdC1OG62i0GWVThepKKGni4X+JPSHrlrtXe3EFPIKi0i?=
 =?us-ascii?Q?Vf5u+kXw9JjsbmOTrZX22FXcPe5C0d0Y9FHAD1FivjTxK2kzYmkI6k4d9lie?=
 =?us-ascii?Q?nKZVSK8X5BKqdI7hUJnYuME+jfz2RnY2Tz2rO+bRXunbCHtAFDd1g4UupI8I?=
 =?us-ascii?Q?F4uZ7IqLU/l40jZOv/s11pJ6FF1E2IVfDwK/N1Ilk7jgU79pFP8RDXC18dlT?=
 =?us-ascii?Q?pO7WhkX4La5ztmeMIk0TXtnsoY/qdsl3+rckvy9ywxfds8pFwtVvhJ+g46fj?=
 =?us-ascii?Q?OjjaVxU0tL01ubdcMaSTVEQ0LCINHgBAjmWERvl6dt1idPsR4dt+ebqAgfbe?=
 =?us-ascii?Q?i/+uzCdSixJC1JSsnWDZN1IIVMeaAPflRooLK4VBR3b1QkMLupVMDIKybiff?=
 =?us-ascii?Q?XJE+yh5iJ0SEaIKqMLzXUHHZJa84YeWKmzXFVHcpOYJG/JNdQPdHigl/unUs?=
 =?us-ascii?Q?nZzFIuwPP1yF1cPVrFLjxM6bTeXuL9MKmPTTl4DusJAW6PWtsqeQ0Esgfqtk?=
 =?us-ascii?Q?vSg2sV+IbpXUvoPOve0iR7okPRavUKjnzGKPcr4ttkAplh5P+PTvE21ZSGAW?=
 =?us-ascii?Q?7tKAeQ/J0Xk0FEc6SYK+TyIq1N/Yacc+NHzupnyxaLp/aOXiyjQqHnPXcgwc?=
 =?us-ascii?Q?PSPhOQR/iV+Xq957MYV+jAdR7hd1PGX+s0p25WFPiYe3c3Hqv9YsD6VY+I6h?=
 =?us-ascii?Q?k3VN1vjG3x4ivJjnSilSmPHxMrIHesYJ9zgx89/0wPr/rsThi9Jimc5ihjvr?=
 =?us-ascii?Q?QFOM1bxRSJYuOm//jdqmxAiJk6hJpeS6GHz0kAMB5v3Doej2Zzm9RyObCv9V?=
 =?us-ascii?Q?lIeDYixu6ibIveAGOYMop2vopG2e+fA6BhOTXtM7u2Nm9Pt+x9Ykir4sltdK?=
 =?us-ascii?Q?ahcPjQfHg5r2c0yUlVI0rvLFT4NvrTKgiqogAlQFEMja8eYzbLElh4ujJfnx?=
 =?us-ascii?Q?TJtuyAaa1nt7kvp6lsG4buZ7xr6wLNAGK1UUYBKtBb3IOzGTpBebvxE8Y+9X?=
 =?us-ascii?Q?qqKI44mWesFvvoL2riwMvCkv/TXYPsbygIsDMI9xde1oMmdtmkawllqM9xBc?=
 =?us-ascii?Q?ZlN0Icq7eBX48n+Xym2v6zjuozXXcj1H/Co3X4aJLTwLr52L0C4MSLTjoRMe?=
 =?us-ascii?Q?vSdB1tHIIQNRSnwItTKyMutUYptqKaWPn148Ezs3GMQyes/0IH0amJ8eoi1U?=
 =?us-ascii?Q?rE0zDSCUURqndnMtmNKOpTw8QbyI7Bko7cXqYzih+VeW7KX/oktvN7nSu2ne?=
 =?us-ascii?Q?1nfBZ/6VJcoyPX2aeX7fIqOs7IYrJ9nMCgqqmf03/fBK5/SHyKaxx9Ff04hK?=
 =?us-ascii?Q?1CjaOSvRgiCGumFBTSgmScphGYw6u4urq03iwFJTTGYSqheRJO1GHBSWUQcC?=
 =?us-ascii?Q?nRCuGSQkYuLWcWnxhiCBJlAAlQsemEJnoqOYyewKxN3qtDiJ/kz/sapxO41e?=
 =?us-ascii?Q?z4bkBDTxQtJw9sS/MzXBKqjN5m8avpZr2PEKk++jByEHPl/DLXZKz4Broi+5?=
 =?us-ascii?Q?2DMlgsQFNWbYNcwY9r+v1YU=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 146fbac0-4f11-4cc1-aae4-08dbb8a60d99
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2023 00:19:13.7479
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WYfOaa7kB4UYBxZyDIBnd0k8rGrdcbtrs/zWb5fA0asvb+XaEfEE7dovNEkai97V3JaNS44toAn00ihySlQ+M6vsKDcSms2Tgtp8ShXM5mjyS6aT2mzl4W4s+vkTf+bp
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB8629


Hi Dan

Thank you for your feedback.
I would tell is that your tool and your help
is always very helpful for us :)

> > Thank you for pointing it, but it is correct.
> > This driver is supporting both "DT sytle" and "platform data style"
> > and "DT style" error only need to use "goto err".
> 
> Currently, this check looks at if there is a return surrounded by goto
> cleanup.  I could silence this false positive by adding a check that
> it has to be surrounded but also we have to have goto in our path
> earlier.  In this case, the goto cleanup was on the if true side and
> we are on the if false side.
> 
> It's a little bit of work to write this code but it's doable.  I'll add
> it to my TODO list (and then probably forget about it forever honestly.
> :P).

Thank you !

But at least this driver case, the code itself is not good match to
the tool I guess.

(A) part need to use "goto", but (B) part is not needed when error case.
Then, both are using (C) part, and it calls (D) when err case.
But (D) will do nothing for (B) case.

So corrent code is not false, but is difficult to understand.
And I think it is impossible to detect it via tool (I guess).
Best case is it follows the tool (= call goto on (B) part, too) anyway.
I will/can do that.

 ^	if (...) {
 |		...
(A)		if (ret < 0)
 |			goto err;
 v	} else {
 ^		...
 |		if (ret < 0)
(B)			return -Exxx;
 v	}

	...
 ^ 	if (ret < 0)
(C)		goto err;
 v	...

	err:
(D)	simple_util_clean_reference(card);

	return ret;


Thank you for your help !!

Best regards
---
Kuninori Morimoto
