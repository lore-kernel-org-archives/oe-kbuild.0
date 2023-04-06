Received: from NAM04-BN8-obe.outbound.protection.outlook.com (mail-bn8nam04on2040.outbound.protection.outlook.com [40.107.100.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B4758BE0;
	Thu,  6 Apr 2023 15:46:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I5dITUwdwjMtZuTUWbw92G/LOcKPDAM8bQquW0sdg6hCJS8sfEmEmJGQB3tvp3yul7Cc4X3wWJeKl93IUk5ms7y+XylH+/wr7hWpdhhPrtVqn1dfT+VTGPjGQHTZn1XLThBqvsmImrD3K912pq3X1Ad8gxzjAO4XQGrr3Is+tTWtxq/vFRiFIVSxemu6G79ntMTeCvGvNSkSrpasEAYaN0M3JRFS/IhoTJ0j1rbUGxtxiGraBABOMgGUmT8X6B/jsxh29CoE5Xe4JyrPTGFByXY3cuomPMBcZ2+rp1K8NCmELgwsANRv0CJ3l2POoDVXJaOwOOeGvrrXisnVNUnSzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mUx7ujWfOKOW6jJqR7nc3lYidBKqOdqWwqnb6bV7GGQ=;
 b=gG5P4N/wiOJD69meYjbeBDcjbpa98nPx9vjoIsyRASphT8HJd3TKzW91MW0lumowetKOJPizfUBq7X7f5fMv0K/tZZTTZBOZkGcjSPGVpV3JBMLAKawTQbrzoSGW7MOXHYsx6tNofFaau7MR1dAMWJpLSdCC/cHiBBg/wI/n4+TEYQWbVkD7cQ6WmfNi43WbC4oPB08Gtjns0rAnJslThDS0CIhBSLz6E+rBXiqu/lbmY91ru1zU2cAzQ6T8Ie/RbvOE+3jT+eAqeM5+61RIH/lgu/LtNGcjWRYjJbx8XmJ4zv0vVbAVuRzah3Nd9HqBAtQbjW2DzE+qHK7/F75XGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mUx7ujWfOKOW6jJqR7nc3lYidBKqOdqWwqnb6bV7GGQ=;
 b=5Nh+uqEyeulgi29QY5Nc7ijtrsA4W8w0gAaHLn58guI7Ltk83sFVoWnkth2E3GHKGaKqySeGKY1HzxV4DKU83XDw3Z4G6e2I35WIYUTQ86mjoo8MVWsn5S/zAwOvuMIysYYlYRlkppgdMfTgdhbj3btXWEAe/I9hsgNKZYHVlgU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB6207.namprd12.prod.outlook.com (2603:10b6:8:a6::10) by
 CY5PR12MB6177.namprd12.prod.outlook.com (2603:10b6:930:26::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6254.35; Thu, 6 Apr 2023 15:46:02 +0000
Received: from DM4PR12MB6207.namprd12.prod.outlook.com
 ([fe80::17e4:b93f:e475:c51d]) by DM4PR12MB6207.namprd12.prod.outlook.com
 ([fe80::17e4:b93f:e475:c51d%6]) with mapi id 15.20.6254.033; Thu, 6 Apr 2023
 15:46:02 +0000
Message-ID: <cdbe65e7-db18-8d29-134f-20ce4ab5a5ec@amd.com>
Date: Thu, 6 Apr 2023 16:45:56 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [RFC PATCH net-next 2/6] net: ethtool: record custom RSS contexts
 in the IDR
Content-Language: en-GB
To: Dan Carpenter <error27@gmail.com>, oe-kbuild@lists.linux.dev,
 edward.cree@amd.com
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
References: <ab0484a5-07a1-4fde-80be-940dbff6a014@kili.mountain>
From: Edward Cree <ecree@amd.com>
In-Reply-To: <ab0484a5-07a1-4fde-80be-940dbff6a014@kili.mountain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO3P265CA0031.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:387::20) To DM4PR12MB6207.namprd12.prod.outlook.com
 (2603:10b6:8:a6::10)
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB6207:EE_|CY5PR12MB6177:EE_
X-MS-Office365-Filtering-Correlation-Id: 96d56f0a-8616-43bc-892e-08db36b6063b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	CD1TKVu8k9yqnR4pZHuODYXesmDpsz7nwOeOFUvCAsmrJQgONfP5+tUcoHG4xZzUmObTRIsV6Vpglv1ahRImcDrkWLnSeM6IBv2NYITkGHoCcUW/emQYvU9KfsIJPHmmg7dr3iTveiQm2JcNYOUHEpVZsAT2UYYkEp/nxTPESSMT0AeFZyYy21q5IVgwwb74VIdG5ybjYav+lude7LNi5rZv/zOqrdgKCehnotgbX3jQxScdVJkMfoI6BPXkvKDK2QARmUNIm8+WzPHzHI1S4XyB7GDYOeqmP83RP2MP7KL0D4W+JVV99MWaCCW0ed+BwaVpM2Ghcq9jUq6GvmIQT+IYmhIN4D5Inq1JH81g/J67MNp5xHwmYxoPZ1qqURs7UCOlxKpvYeM2g/tdxf84MLHoAWYfH9FVw8DFuMUo2DnS61JCi94yK76i465br6dt0+wUAX/gseuXeL1Qi30zLyQemCpwpCE+18/PDQdhcdeWrSBSTF4hXtlLssRDcblOwgcQuc3pyxWf0XRJZ0Ug4omQGt00lOyJW7eUURK/Zcok7cRiRqSxF6httGW30eWoAclN7bdgtVAWYIItdpZMn/mLdVBzNwDRFXgcUbKQaNNzRpcCOLcaI52LbqssfQ1p19T+8X21I9sN5qCs1mztQw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB6207.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(366004)(39860400002)(346002)(376002)(396003)(451199021)(31686004)(36756003)(558084003)(38100700002)(5660300002)(66946007)(31696002)(66556008)(2906002)(8676002)(8936002)(41300700001)(4326008)(66476007)(6506007)(2616005)(26005)(83380400001)(6512007)(6486002)(53546011)(478600001)(6636002)(6666004)(186003)(316002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aFhYZTVtbG1GV2NYeWV2VCtRZmNYZVp4aDVRMS80aFRibC85TjNrV1VmSU5a?=
 =?utf-8?B?akp1NFhZdHlsOUQxT1ZidDZWNmlBLzZ1dXhvbWN2RUZuVW5VZGRGWWllMndk?=
 =?utf-8?B?cGRlK3FCUHp6ZWlIQUl6QUZUcGlodkFPMWNLa2d2VFdsNEhMSlVsSkNXUU9i?=
 =?utf-8?B?bWsvbHAvZmJhWGx0OWFRdUJkQ2czSlVYbnBnRFlBQ3lMTXRmcTlDSVJhT3hF?=
 =?utf-8?B?ZE82YXBOd1FGVytTNEE4RzJEME1YbE5rVjhkWXkvVVdlOVJYUk42OUdnZE1j?=
 =?utf-8?B?N3NqSEU2b25mSXNJU3o0SENmeDZEZkJMSUJRZm9XRkk0cW9PcnY1bDVyUkF5?=
 =?utf-8?B?N3hvUzNlZWRFeVFodDYzcXhLRTRXNVh3L1ZXQkRBdmJzSmt4M3dyZ1RkUXJq?=
 =?utf-8?B?cVQ2bVdtMnJoSHA1em4vN0F3UFJuTjlFWjVVYTdOOTNHMldlRm9DMFF3d3pH?=
 =?utf-8?B?clFaZDhtaXdsY3hXdXFFMlU2Q1JsN2lOdU1rT1IyblB0R0syM1htYVI0dkRE?=
 =?utf-8?B?alExYTZGVWdJRGNzKzdTNEVNcEROay9hT3lmbVYyK045L04wOHduU1RQSW1y?=
 =?utf-8?B?SHZ6ZG4rcEcvdjRqV3NIWWZGbzdYeVpEVVAzaDZ5eVJoZnB2ZkhoWTllZkFi?=
 =?utf-8?B?TUV2MWJzcTkrUERzZ2xuWEFrRUFLUEtZTmkwc1JjR2R6ZHI3b1RaVjNWQ05W?=
 =?utf-8?B?azhsNHhiNzdUQ29YdzNKSy9OT2dmbHluVGxjV2dZSnEycHRqYTcycVdvMGtz?=
 =?utf-8?B?dkNvWTF5TUs5R2w2Z2ZiaytoZkx1YXpwcDZlS09TWm9vcitQbW5lZ0R0ZEg0?=
 =?utf-8?B?aHpEWWNNZjFyQlJSL25VTXZsQkRsR3F1RU13aXdZWXp6VUFnb2hzUnBVallU?=
 =?utf-8?B?RG03Y3R2dGw4ZmFOcEtFRDB0alZLK2paMVg4RkI3SkxvMnppRjErZHB6R2xk?=
 =?utf-8?B?TnphNkRCQmJqdUcxMVBXT1VTWXBzc0doZTZ6aS9Gb0x3cTJTWmlzckNVT0JD?=
 =?utf-8?B?VUlYcmxMY0dIWEwxL0hKUG16Y0lXSEpBN21GTTMvYUxwdE9wUGxpTFBsWERS?=
 =?utf-8?B?blFZNEd5RUs2VXA3eWthZk0wY25HUjA4bEhIZHVNbDZYc3NKS2Vsaysrbmta?=
 =?utf-8?B?Y3VPcm1XU004OXkrcThFZkJwazlKOTcvVHZrNWFiMzhDbE1sQ2N3clJiS3Ja?=
 =?utf-8?B?Uy95RVZnY2tMTDlBazE1aE80bExCSTlMY2U2WUVwdGkwYmhnZEowMnh6WkFR?=
 =?utf-8?B?VzEwVnFZdzB6UmZkRWcvQ0JUa1FZd0hQWVI3a1QvUkNxa08zSzIwdjRYaUgv?=
 =?utf-8?B?NjJudFVndzZaakRMUzdBWXZSWHkrRmRuMkpPMjdmbmxtK2dTejBtVnA1RUU4?=
 =?utf-8?B?TVZwQS9HTUZGQlNzWE5hVGNJeFQ2aWtDaGFoanZRSzYyUmVRZE00N2grMk5P?=
 =?utf-8?B?SktoNjZjQTVmTnE0MkZscFpCdkVVY3JkcEJ3eWRRblV4cm8wMk03dkpTaTZ3?=
 =?utf-8?B?Y0pzZDJ3M3FGak02Z2NWdGtlNjhGRmVZZUlncWN6YTFPQmlZYzJucWlTaWxt?=
 =?utf-8?B?RVBDbzJCaGMwRVM0dlV3dTVIS2RFR1VZWVV6VkJBaHZSb2JhWGZrUVY5T0Jv?=
 =?utf-8?B?R1BOMDZQTzY2NzMzK2xPb2JrWXE2aHQrbGFhQmFtMVJpWndvTkNxSFp2Vkxz?=
 =?utf-8?B?em55MU9uQ1gwbTRyOXRLK3Y3czZodU9XR29hbnRTNlBZd29ZYmpJSHUxYnVz?=
 =?utf-8?B?REpjOXBOUUJPaUlBZEdmcGFydUdycVpTV1ExNkkxMmJHWnRmamY5Tm1mMUc4?=
 =?utf-8?B?MEdYaTJpUlJoRG8xWER3dmx3bXpQcXNwaWhqN3NIWXNablJzT0swUlFqN1Jo?=
 =?utf-8?B?aEhwcUxNZ2k3SnhTWXlmOC83MXlRR2hDYkY5b3ZlUGs2RS8wWjlRK0VUMHdj?=
 =?utf-8?B?dFR1TWVSZlFpelBBdUh0cWkwUC94b3NDRTdsbVc1NjJvY0pEb1BVVG5HQjFD?=
 =?utf-8?B?RVB5cGlVdkFzMTBCWGFsSzNKTnlKQWwrRjVFUit2U1gvVWwrcStsQVVUazAx?=
 =?utf-8?B?Vm9Wd3p3Y1VHRUI3M1dzNnllS3RmeCs2Q1lKZjU1WWRZUjJlbmFkYlh3VFV5?=
 =?utf-8?Q?R71o=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 96d56f0a-8616-43bc-892e-08db36b6063b
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB6207.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Apr 2023 15:46:02.2217
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zf9anK1cZgMxQgadajXk3zk5vwc+17GoRLVhwvVR4yg3NAQfQjzpG94EJo32dep1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6177

On 06/04/2023 10:07, Dan Carpenter wrote:
> New smatch warnings:
> net/ethtool/ioctl.c:1402 ethtool_set_rxfh() error: uninitialized symbol 'ctx'.

Yup, it needs to be initialised to NULL for the default context case.
Thanks for catching.
