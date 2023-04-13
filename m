Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2073.outbound.protection.outlook.com [40.107.92.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E84A628F8;
	Thu, 13 Apr 2023 08:58:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IrxzytO9tGvMq7/jzRx3hpONnPq3iFVOeW3ASrHy92M3LMoAB7cX4BgHx2eKaoULKPRgpGvvlMZjbi9fC4A/RbiGjJ0tea77+FEf4/3mrfYqVSvpl01QruKZf6Zl/FZ8IdfeyS+02yySCdwQ7XoZJpNOQwN5CSCKsaZINjBA/IyYP2Kas5bYfOjxtmMCB/3BVWRtQlja1pejOjrfoxyfw15ozZnSbO43+FaJxnqp/6hAx5DdZjjy19LqRqAqPzCVD9G0NnT3yLn93Nug+djZoJKsMKica0l5KuQq7cF7FyWwPuFfjzaBemARHcer2YH3KP/pMngLgpRWgRtMwztWaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+WgG0aVpwvI5rqaZhAqZbINtxDXRK93zGyiMAWS536U=;
 b=PvWCyDOTzGrb9N/rVRoAxm2ZKbF1QaaMX+lzgZJT4eQpEnLuRCTA8W4h0MwHVdAg/TUBd/IK0CQXgIgG3W9dt2RZXoRL5GSBTOcNHUY10VtmhSISvw8JOuxLm5B7QFvE57v13Y48Nes8GnBRMCSxEHofc2VBYO9lP/DRudl2ciORSBDah9og1OU8o0ylJqhEelHxWKXe2yLTghsER+qawvHiou0UBPDfTNM3GQocUA8/CAw454vabM3d5qrUXa3JuvATwjjEyNijnFriUBtMkzXSuIjubWrFzyti152sOtxUIETiGLV6i6gCzWAFqUEvHR7JDuQnAkrB7/b2uwhSOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+WgG0aVpwvI5rqaZhAqZbINtxDXRK93zGyiMAWS536U=;
 b=W2lLM3RQNFjOFpUn/S6dMzNlKaSCP5n7ZQNzwObmf2jQwGyh6lLV3VnQrL7YQq+IWvhrPNe7eyCIBL/XWdR51yuvwbFRrfxDSZfu3XN9biczZ77cEsUtawvmp2hJD+2QTmPXFbkldOBTjhydjL8j4GSBV5Q/qx54YEVgCwbueE0/aSqgZhZvHq0d5G68qbghUArGTofb3j0JmlpOh7XXGKnxztzBt7cVWSrMgSuJPb9lVW/osXNP7p/c+tkmKX27nJPv/S5KiFtXghYk1HfTt7iAF3TBQjBfQh+BYlchZoh3Xgy4Hld7/cV8yc3f/p29NhTYy0Og5Px9GPrPwvZKZA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM8PR12MB5413.namprd12.prod.outlook.com (2603:10b6:8:3b::8) by
 CH3PR12MB7668.namprd12.prod.outlook.com (2603:10b6:610:14d::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6298.30; Thu, 13 Apr 2023 08:58:01 +0000
Received: from DM8PR12MB5413.namprd12.prod.outlook.com
 ([fe80::9027:5b60:c36f:4255]) by DM8PR12MB5413.namprd12.prod.outlook.com
 ([fe80::9027:5b60:c36f:4255%8]) with mapi id 15.20.6298.030; Thu, 13 Apr 2023
 08:58:01 +0000
Date: Thu, 13 Apr 2023 10:57:52 +0200
From: Thierry Reding <treding@nvidia.com>
To: Dan Carpenter <error27@gmail.com>
Cc: oe-kbuild@lists.linux.dev,
	Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
	lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: Re: [linux-next:master 8309/10976] drivers/gpu/host1x/context.c:82
 host1x_memory_context_list_init() warn: missing error code 'err'
Message-ID: <ZDfEEOEoMA55t4ol@orome>
References: <ac98d66d-8735-4963-8cdb-be891d134cb3@kili.mountain>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="X3Ac/cOqwsYuirHe"
Content-Disposition: inline
In-Reply-To: <ac98d66d-8735-4963-8cdb-be891d134cb3@kili.mountain>
X-NVConfidentiality: public
User-Agent: Mutt/2.2.10 (2023-03-25)
X-ClientProxiedBy: FR0P281CA0156.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b3::10) To DM8PR12MB5413.namprd12.prod.outlook.com
 (2603:10b6:8:3b::8)
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR12MB5413:EE_|CH3PR12MB7668:EE_
X-MS-Office365-Filtering-Correlation-Id: 09b222c9-e795-47f6-c432-08db3bfd2f9c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	lZdC9GX+VB6joGd7sQ9v6AytPuLLjSBAwit0kS7Oe7ap/gtKrgHldL24NCkX2J85JevhUWxLv6AhTZcunExrj6reagsj4LdUuYnMb5AWqCp1t/5yjwBIDjE/ElCJC2fg4BK94Y2PIyL3+IJmqrTGmw2LY9BCbA/MFZbFtRK7UILyuf45A/xL5mR85gnqgwqoMs0JopMT8brKJUFkq0gjAlAV9GON/z3iMZXCkEbWgdVoVkttjM4bZbqO0oFcnnRB4l6SH27imLLFOosD7OpL0lqzzkXKNzP08o6sTJ23BUxPJaOktekVDhGq3Z5v/8A5tZvlx9BAw3x7Of41kkvwYPUePFWUYXYEQD6KATF2GGSh5Vg7QIMzxS/ZYGLXSjuSD/3WOpL+/PJAOBqrtbi7/T9dS9UWA2EqFU+dm7aBw2sCHOoFlSC7TMwteM5DP+zRdmcXe/dLEnnu583pXa1T3ooos5xFtzet7zh+azvYuQlKQ0UqMbMbkCyWkQFwly+as1Eq8GRmvh1jIR6KuQkChYhVe42BniEC8X14QxEVn5eTRxRpO8xE2Be8aXkNwO2oglRMwuk2vmYB6D2CmCU1KtNpbiHSLCTtTZK2MbLtM/3X/jJGbi5sYemBSF2EiV+4TzHlUnycpROkANuyeQ3dDz63ZVs0+VN5GvKkRnK8p9GiGu5oU+0DNF8x8GLoukyZr5YgXVXWPoS3SZM0/FkcgLhCef49zJr4z6xnFT1vVWA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR12MB5413.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(7916004)(376002)(39860400002)(136003)(346002)(396003)(366004)(451199021)(5660300002)(8936002)(478600001)(54906003)(6666004)(6916009)(44144004)(83380400001)(41300700001)(4326008)(966005)(8676002)(66946007)(66556008)(6486002)(66476007)(316002)(9686003)(6506007)(4001150100001)(6512007)(186003)(2906002)(21480400003)(38100700002)(33716001)(86362001)(2700100001)(357404004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?nMR5hGeJD5atp8RGMynqIdr/qNsLb/WS92tRMXFSB+EuKyVkalgTfxvLsUWO?=
 =?us-ascii?Q?Kwt3mtyd/ToOFQF4c/Db5n2H0+kxBQpklz06NzSCAKzeisEdLduPKLnjIJve?=
 =?us-ascii?Q?D9gZzRGHu9/ZSwC80BS+ZIr96G8kxC+Da/mMcU8IVea60tegJnjIzTZhkUc0?=
 =?us-ascii?Q?5HDDAevS/HmxqMTLES/5IA8HzFGnas/gsyVC7u+JvOriWTKd8fP8McyxeC+K?=
 =?us-ascii?Q?OZqdMdZAeeDn9XECkKuQska8JkFbxhZULHx3uMqY6CY0IQiXHdylctRTjyou?=
 =?us-ascii?Q?qitjQsUx1P2F84yEF5797ig/Nly2mbMpJk3u5o/4hhmE6T7TfihgsUUN9cY6?=
 =?us-ascii?Q?RMUtg7xu6wSTW5rC0mis40pe5GXPeFt0xMBgkwj7/Z8Qqsek6YFQHiETRL1x?=
 =?us-ascii?Q?SSIUCpkUNw4SISl3SHfcuR1IW18Lqs4h5VgpP6oYDI4FqNJ3h5gpD5vfq5zH?=
 =?us-ascii?Q?Ad6jJcJNBNhRiAfEHrDSi7DvDvO9GlQsZVKl3SNFj60k12GNnyJ58TyPpZdW?=
 =?us-ascii?Q?7PxLUFpNzsmfNkWjWEsDA64rgOmcXwlZS/UFac60VFhRDsO+1U3HrznSsTRi?=
 =?us-ascii?Q?92kNukdzvxtTW4rMSClNSUxjMP7+glcDkmVpWyvYlrTQU+f5HcMNpyk2gjiV?=
 =?us-ascii?Q?it3XOz4F/tDqD+H2pAf3M6YfGb9cji1TnrTC2GSzzZJLNHGaelA4NkGGQ7Zs?=
 =?us-ascii?Q?/FMqsBN1MdqRTf+0XSI1rlCw11Y1DKP1IM///YeOYvtGLSVZ1pXxJPPU8QVy?=
 =?us-ascii?Q?amy+r7BLr959rlqhC/SMcgLMiH08qwEym3ZgRGCAFOsC2uBHkaNHYoLUrtfI?=
 =?us-ascii?Q?zTDCNmubwBBuGQC2RpKbMhd3u0bQ5dfPcgHgV/qWjTM9y5SfCGwfPMmAUPJE?=
 =?us-ascii?Q?rQUNg+8CKDIyK/Ekp3GCun4HyhQGeUQbLnKEgRxnC7h7AjEKE7TdRfgD6khh?=
 =?us-ascii?Q?pFXmpdWn+uJgCdIRXCl1mt/sl6BPVnf+MEkELDljgvL8F3cVVG2f7heWIGDC?=
 =?us-ascii?Q?rD2nnUZITJjuv2gEjf6N15BsiTCOHfIPu5jD1E5jN5JLvzG2YIuZtDfq8bIm?=
 =?us-ascii?Q?nZaLySDB43smBabvyaNOEpCV/skIjA9UHhos67f9xZ0CVttsH3Ri7/c4wZIL?=
 =?us-ascii?Q?r8IzdycO3dNQY6YrCrfYb5Obhm2NB29Ax1IgdtzQgrUinLUIZLyWW5PBnTNz?=
 =?us-ascii?Q?b0Eqs+KwJ2EvFpqgBmWlGc7jkhu0ziRKOzeU3Pz0TAsyZTHUWG7lkUq6Y6KI?=
 =?us-ascii?Q?XMXxL2y6tVX0rAEfBVHIk333tO1L4fmAAMYdh5v3ea9MTtjacghf21CtUWNW?=
 =?us-ascii?Q?m/IbtOlMubPmz+2xL2E8yrCufGq9zMWjc/ITRoBFngRi1FVZpfEXJAQtQH/P?=
 =?us-ascii?Q?sK6UP15qHS0EOqA+DFZJd3BrK7TJEP/7BX70CC0WbLds61J2NAX3nXbyJn1N?=
 =?us-ascii?Q?BFyGvfPfKavV5caeu4bKReymG9w7kv887Sc0s24HhsYLJKUd+ZXsac8x8fIx?=
 =?us-ascii?Q?AOQi6tI+WgLzC7yqiVtGJdHUihqMTpQ6tcaonwqlyO1tFZd81SW/dxGkK3JV?=
 =?us-ascii?Q?XCRsyadS53vgwV/shmtl+A93xZ5LX5a2Yfhr2kfvqIL93trP+dk2lB/DdtTL?=
 =?us-ascii?Q?sSe4SGNovK/PQ11YwdFwresPlXN/6ZhM0tjLyGbx0vpR?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 09b222c9-e795-47f6-c432-08db3bfd2f9c
X-MS-Exchange-CrossTenant-AuthSource: DM8PR12MB5413.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Apr 2023 08:58:01.6528
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: u1FdzwPlkXuvSFWQLvXJ9JvH+oq8lJVCLBGRMzZrKzryfp5ZZ11iDul4dYPArIiafhJRVVfnIpiCdo2KLAc5HA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7668

--X3Ac/cOqwsYuirHe
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 13, 2023 at 08:06:08AM +0300, Dan Carpenter wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.g=
it master
> head:   7d8214bba44c1aa6a75921a09a691945d26a8d43
> commit: f75d19827b731c6f24930ef77e5a46cf2242bc68 [8309/10976] drm/tegra: =
Allow compile test on !ARM v2
> config: xtensa-randconfig-m041-20230411 (https://download.01.org/0day-ci/=
archive/20230413/202304131214.MOOEMszN-lkp@intel.com/config)
> compiler: xtensa-linux-gcc (GCC) 12.1.0
>=20
> If you fix the issue, kindly add following tag where applicable
> | Reported-by: kernel test robot <lkp@intel.com>
> | Reported-by: Dan Carpenter <error27@gmail.com>
> | Link: https://lore.kernel.org/r/202304131214.MOOEMszN-lkp@intel.com/
>=20
> smatch warnings:
> drivers/gpu/host1x/context.c:82 host1x_memory_context_list_init() warn: m=
issing error code 'err'
>=20
> vim +/err +82 drivers/gpu/host1x/context.c
>=20
> 8aa5bcb6161206 Mikko Perttunen 2022-06-27  21  int host1x_memory_context_=
list_init(struct host1x *host1x)
> 8aa5bcb6161206 Mikko Perttunen 2022-06-27  22  {
> 8aa5bcb6161206 Mikko Perttunen 2022-06-27  23  	struct host1x_memory_cont=
ext_list *cdl =3D &host1x->context_list;
> 8aa5bcb6161206 Mikko Perttunen 2022-06-27  24  	struct device_node *node =
=3D host1x->dev->of_node;
> 8aa5bcb6161206 Mikko Perttunen 2022-06-27  25  	struct host1x_memory_cont=
ext *ctx;
> 8aa5bcb6161206 Mikko Perttunen 2022-06-27  26  	unsigned int i;
> 8aa5bcb6161206 Mikko Perttunen 2022-06-27  27  	int err;
> 8aa5bcb6161206 Mikko Perttunen 2022-06-27  28 =20
> 8aa5bcb6161206 Mikko Perttunen 2022-06-27  29  	cdl->devs =3D NULL;
> 8aa5bcb6161206 Mikko Perttunen 2022-06-27  30  	cdl->len =3D 0;
> 8aa5bcb6161206 Mikko Perttunen 2022-06-27  31  	mutex_init(&cdl->lock);
> 8aa5bcb6161206 Mikko Perttunen 2022-06-27  32 =20
> 8aa5bcb6161206 Mikko Perttunen 2022-06-27  33  	err =3D of_property_count=
_u32_elems(node, "iommu-map");
> 8aa5bcb6161206 Mikko Perttunen 2022-06-27  34  	if (err < 0)
> 8aa5bcb6161206 Mikko Perttunen 2022-06-27  35  		return 0;
> 8aa5bcb6161206 Mikko Perttunen 2022-06-27  36 =20
> 8aa5bcb6161206 Mikko Perttunen 2022-06-27  37  	cdl->devs =3D kcalloc(err=
, sizeof(*cdl->devs), GFP_KERNEL);
> 8aa5bcb6161206 Mikko Perttunen 2022-06-27  38  	if (!cdl->devs)
> 8aa5bcb6161206 Mikko Perttunen 2022-06-27  39  		return -ENOMEM;
> 8aa5bcb6161206 Mikko Perttunen 2022-06-27  40  	cdl->len =3D err / 4;
> 8aa5bcb6161206 Mikko Perttunen 2022-06-27  41 =20
> 8aa5bcb6161206 Mikko Perttunen 2022-06-27  42  	for (i =3D 0; i < cdl->le=
n; i++) {
> 8aa5bcb6161206 Mikko Perttunen 2022-06-27  43  		ctx =3D &cdl->devs[i];
> 8aa5bcb6161206 Mikko Perttunen 2022-06-27  44 =20
> 8aa5bcb6161206 Mikko Perttunen 2022-06-27  45  		ctx->host =3D host1x;
> 8aa5bcb6161206 Mikko Perttunen 2022-06-27  46 =20
> 8aa5bcb6161206 Mikko Perttunen 2022-06-27  47  		device_initialize(&ctx->=
dev);
> 8aa5bcb6161206 Mikko Perttunen 2022-06-27  48 =20
> 8aa5bcb6161206 Mikko Perttunen 2022-06-27  49  		/*
> 8aa5bcb6161206 Mikko Perttunen 2022-06-27  50  		 * Due to an issue with =
T194 NVENC, only 38 bits can be used.
> 8aa5bcb6161206 Mikko Perttunen 2022-06-27  51  		 * Anyway, 256GiB of IOV=
A ought to be enough for anyone.
> 8aa5bcb6161206 Mikko Perttunen 2022-06-27  52  		 */
> 8aa5bcb6161206 Mikko Perttunen 2022-06-27  53  		ctx->dma_mask =3D DMA_BI=
T_MASK(38);
> 8aa5bcb6161206 Mikko Perttunen 2022-06-27  54  		ctx->dev.dma_mask =3D &c=
tx->dma_mask;
> 8aa5bcb6161206 Mikko Perttunen 2022-06-27  55  		ctx->dev.coherent_dma_ma=
sk =3D ctx->dma_mask;
> 8aa5bcb6161206 Mikko Perttunen 2022-06-27  56  		dev_set_name(&ctx->dev, =
"host1x-ctx.%d", i);
> 8aa5bcb6161206 Mikko Perttunen 2022-06-27  57  		ctx->dev.bus =3D &host1x=
_context_device_bus_type;
> 8aa5bcb6161206 Mikko Perttunen 2022-06-27  58  		ctx->dev.parent =3D host=
1x->dev;
> 55879dad0f3ae8 Yang Yingliang  2022-11-26  59  		ctx->dev.release =3D hos=
t1x_memory_context_release;
> 8aa5bcb6161206 Mikko Perttunen 2022-06-27  60 =20
> 8aa5bcb6161206 Mikko Perttunen 2022-06-27  61  		dma_set_max_seg_size(&ct=
x->dev, UINT_MAX);
> 8aa5bcb6161206 Mikko Perttunen 2022-06-27  62 =20
> 8aa5bcb6161206 Mikko Perttunen 2022-06-27  63  		err =3D device_add(&ctx-=
>dev);
> 8aa5bcb6161206 Mikko Perttunen 2022-06-27  64  		if (err) {
> 8aa5bcb6161206 Mikko Perttunen 2022-06-27  65  			dev_err(host1x->dev, "c=
ould not add context device %d: %d\n", i, err);
> 55879dad0f3ae8 Yang Yingliang  2022-11-26  66  			put_device(&ctx->dev);
> 55879dad0f3ae8 Yang Yingliang  2022-11-26  67  			goto unreg_devices;
> 8aa5bcb6161206 Mikko Perttunen 2022-06-27  68  		}
> 8aa5bcb6161206 Mikko Perttunen 2022-06-27  69 =20
> 8aa5bcb6161206 Mikko Perttunen 2022-06-27  70  		err =3D of_dma_configure=
_id(&ctx->dev, node, true, &i);
> 8aa5bcb6161206 Mikko Perttunen 2022-06-27  71  		if (err) {
> 8aa5bcb6161206 Mikko Perttunen 2022-06-27  72  			dev_err(host1x->dev, "I=
OMMU configuration failed for context device %d: %d\n",
> 8aa5bcb6161206 Mikko Perttunen 2022-06-27  73  				i, err);
> 55879dad0f3ae8 Yang Yingliang  2022-11-26  74  			device_unregister(&ctx-=
>dev);
> 55879dad0f3ae8 Yang Yingliang  2022-11-26  75  			goto unreg_devices;
> 8aa5bcb6161206 Mikko Perttunen 2022-06-27  76  		}
> 8aa5bcb6161206 Mikko Perttunen 2022-06-27  77 =20
> 9026ba722360ce Thierry Reding  2022-11-17  78  		if (!tegra_dev_iommu_get=
_stream_id(&ctx->dev, &ctx->stream_id) ||
> 9026ba722360ce Thierry Reding  2022-11-17  79  		    !device_iommu_mapped=
(&ctx->dev)) {
> 8aa5bcb6161206 Mikko Perttunen 2022-06-27  80  			dev_err(host1x->dev, "C=
ontext device %d has no IOMMU!\n", i);
> 55879dad0f3ae8 Yang Yingliang  2022-11-26  81  			device_unregister(&ctx-=
>dev);
> 55879dad0f3ae8 Yang Yingliang  2022-11-26 @82  			goto unreg_devices;
>=20
> error code?

We don't actually want this to be a fatal failure, so err =3D 0 is what we
want here. Should we set err =3D 0 explicitly here to appease smatch?

Thierry

--X3Ac/cOqwsYuirHe
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmQ3xA4ACgkQ3SOs138+
s6EMLRAAm1hgQMpTYrQrgKlgFAwi1QQ2O/N6TYUo42cG5pj8N1z+s8JClCeLe5Gb
WMx+ug46yTUuYhiIm6cl5U/Jxs79jC+jM5gRV7Xdl5gJwDraqyW+/Rh6nOgdoVwQ
KhL/LBNfCw4uN3ZcudS8P5xlh9TQJbpwhjZifXQGDNcvTU5fGltv8rr28Hj2YGl/
UTbJS1eWIFqjvalKGuat7mnp4D86roASi49gpdwggAReo2lmhvtKHZhpSOtTumbp
aw9OBX/pE0Av8NhfAG2aKHI7XXPDtresK3KGBD66XL9oeW4vALg132gvw3F/0GiV
3fk0lShoBgBxQcKFLaJ1QzIPTS6kUzEMUauOq+h4Bz6njUvKJFe/8BaYcA/GEvtc
xciF8Kd3qg8KcusDRg12luOTI1qsDI6sm8Zj0mScxX8EKw4ThOqNsBdthyeok3rG
xS37ijHFNQUFkv3kKT3F3lqJ6scjaRWbyxeBVFjX3Yl7A6b684ZJLQc3YfdH46MA
R9mQBLwH/cN1AiFAgqDjAvxzsK945VcbwJ1qB6Fgfa+dKwF04LrFIedbjC3m5O1t
lJw7o1mj/UIl76G+OAZ94RpO4mA07Yt/I5lLoH5/fcEBbEJof0dhgO4BJ7akbEJ4
FgTxrJ/02K/ZaLsGzOFGFidGZuYFM5gg4DH72zBfmSSppryGqOI=
=Hrzr
-----END PGP SIGNATURE-----

--X3Ac/cOqwsYuirHe--
