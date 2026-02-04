Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011044.outbound.protection.outlook.com [40.107.130.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C94043D1CCC;
	Wed,  4 Feb 2026 11:13:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770203615; cv=fail; b=EW/5LkqMFVTkLadWZeYsK/CEN0NSEW5BMrsmmWzP0zIaZVxU6cEZ2jPWbHw4Mxl1oSj6x7QflFqzXH9pAona4XdYSKRoh/nnWusQHbruMpunAUj0SRb6peYGTdLKMtisVlgFVPTfRntYmkxAPhhCDLoLvYPASeIUtcFTownlzXk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770203615; c=relaxed/simple;
	bh=Gte5TBEAg2MvFCoyji6x74jBARUZU+6ZZhjxR8T2UwA=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=WkKItkIFBYwCpaKaIlj/R5DbP88k0QihVT5eeb+uHenVwnyZVqmx8thSvsH53J6S0jQtYxUYJRforw5CvcT6D+Ci+flhGaLhSOw3qJmlLDGfMetG42sdrkvpdvnso35fsKz/RGpKrDRPMiEKhePHZcpPbqG3hH+jeyWADmYByUs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nokia-bell-labs.com; spf=fail smtp.mailfrom=nokia-bell-labs.com; dkim=pass (2048-bit key) header.d=nokia-bell-labs.com header.i=@nokia-bell-labs.com header.b=Lqn++OM4; arc=fail smtp.client-ip=40.107.130.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nokia-bell-labs.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nokia-bell-labs.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nokia-bell-labs.com header.i=@nokia-bell-labs.com header.b="Lqn++OM4"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=i7AauwsRAqL9sM+v00gGN7HihpgEzX+lQaYnt8LaitWpXN5oYerYxS11705Y5+wspDQDXkzIo+gqOIAsCfSNgn7ph7j/ZYPdhX2mOXaFCIN0sfUY/nTeWyFpuKMwNyAy8ph3tCGEzfEd+GHWilZOBC2jEFr5s9Uqmn9bQcPh+i4bLDsM3le/n9UCc4CvePe1tbbstYYFLIVGH8KYSP9qDKTBmaUCu2Yt8etTzq5shzAcB9G5/YoIVkNEy4APazelup42glBsMvv5nB0FEsSFsOpdPBfZN4F3j0mRL/no2f2lOtdx9rGhKeTNnFsaUa8oGcYNmME0FjN9i56bB2xyeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=klRJYyc5x4DSK+oyzpC3mu6hZtjlKvLwgsO5vG2NEz0=;
 b=KjJq33JPcK0tWm0vRYeks6Cr7rIiaTETAp4EOo9KSw3onM3oDl7BALuxRzZgZEH1B0JLxdWaQhH+yjY58JtPqpG73ISJekWvlhHwUtvvkDhB1FCUIkzQCIXyppV/bxeh1HsOC8bGsDM7fcKvAJz56Tgo65LAGt4xmMTEMV9DQdHZlMsKs3lTgqrnubQTbyRUf0DiVpyCQmAFi8myjs6HRwzDiKk0byeMSXIo0X/gidATdRQ6vn0eaqnwiu2NCRhmD47MlLgtQNxS3qCCt2EpkTKXb9Qj/9/zm5vO8QzGtWdfeqMpf5vw0xYksWx61T61b/0E2p4Vo1UJ5E+g1qD6Zg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nokia-bell-labs.com; dmarc=pass action=none
 header.from=nokia-bell-labs.com; dkim=pass header.d=nokia-bell-labs.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nokia-bell-labs.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=klRJYyc5x4DSK+oyzpC3mu6hZtjlKvLwgsO5vG2NEz0=;
 b=Lqn++OM4iHwQSF2h4VmNUM4JsAFdz+5ZjJEoxjuClG7xhrhqsZSfdWhDjdys8bIu9MVaVgsd8OAdHWSo88z4tjGcRabbMN2ltMbkONzSFsClbtnkl0sdVMhOi3OFYbDAcSe/70gOV8Y518HBaNV2OwYXakwgUJOTFULf5MkOaJhOGIVx8pm/Y9lAIhCLrS44bQpt0YflwbZNRc/hKDlWAhdZ5C8a+dfYIbJtollPdk6shDL+94rPe+xsV2dJQLUZR0Goc5MLczZZF9WEn4YmmoTplD4WT2VBxOPbq5I4R+R5ErzxdAM76+WA3sPR9B0nXFECxapr6dDR5JvrnxDbCQ==
Received: from PAXPR07MB7984.eurprd07.prod.outlook.com (2603:10a6:102:133::12)
 by DB8PR07MB6476.eurprd07.prod.outlook.com (2603:10a6:10:135::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.13; Wed, 4 Feb
 2026 11:12:18 +0000
Received: from PAXPR07MB7984.eurprd07.prod.outlook.com
 ([fe80::b7f8:dc0a:7e8d:56]) by PAXPR07MB7984.eurprd07.prod.outlook.com
 ([fe80::b7f8:dc0a:7e8d:56%2]) with mapi id 15.20.9520.005; Wed, 4 Feb 2026
 11:12:18 +0000
From: "Chia-Yu Chang (Nokia)" <chia-yu.chang@nokia-bell-labs.com>
To: Dan Carpenter <dan.carpenter@linaro.org>, "oe-kbuild@lists.linux.dev"
	<oe-kbuild@lists.linux.dev>
CC: "lkp@intel.com" <lkp@intel.com>, "oe-kbuild-all@lists.linux.dev"
	<oe-kbuild-all@lists.linux.dev>, Paolo Abeni <pabeni@redhat.com>, Eric
 Dumazet <edumazet@google.com>
Subject: RE: [linux-next:master 11349/11582] net/ipv4/tcp_output.c:754
 tcp_options_write() error: we previously assumed 'tp' could be null (see line
 722)
Thread-Topic: [linux-next:master 11349/11582] net/ipv4/tcp_output.c:754
 tcp_options_write() error: we previously assumed 'tp' could be null (see line
 722)
Thread-Index: AQHclcMtCx+aBf4gbEa9raGEe9dZObVyX5tA
Date: Wed, 4 Feb 2026 11:12:18 +0000
Message-ID:
 <PAXPR07MB7984753C52676A18C4CC9C07A398A@PAXPR07MB7984.eurprd07.prod.outlook.com>
References: <202602041310.ZBuXDXC5-lkp@intel.com>
In-Reply-To: <202602041310.ZBuXDXC5-lkp@intel.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nokia-bell-labs.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR07MB7984:EE_|DB8PR07MB6476:EE_
x-ms-office365-filtering-correlation-id: 16e072f7-c76a-4672-4d79-08de63de425e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|366016|1800799024|7053199007|7142099003|38070700021;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?01OsmNm+Q5uJxLL5aRG+43zeaLU8ceadXAx8eGE7Snu5LT/xiR7rWJIITC?=
 =?iso-8859-1?Q?OlK1hRGZT+Td4yDSceZOOLBvMnKRZcB5GFGTCRlyNMpfx2Y3I1gBrejvCU?=
 =?iso-8859-1?Q?LljBcHgdnDn8CXMEoc6XEmqxkOlGlLeXcw+LT1kHgEt7lL/Ur8/gn1O+ok?=
 =?iso-8859-1?Q?9mCfK4gJv81UqZURveKjeN80cz/ozmj0SfQ7JZ5XqJHyJrfpRsLUKkdjts?=
 =?iso-8859-1?Q?Hd5l0ZTv1HLgwiRwLSxecMD0WG2cwq3ztOWW2ZHillGteBJFYkAYglW5zV?=
 =?iso-8859-1?Q?ikHhUn0EzZKvO2hq++N4per/z5DhYitG9aw9AxjusMpbEkys98GMAZvuki?=
 =?iso-8859-1?Q?PL0HHVNgC8a+fkRl+kRb0TOUy1TenJaI4pe7sApLu63Jvdz0npfBSKJ5D6?=
 =?iso-8859-1?Q?yY0yTXiWr2gLkR04A5aYIyyikm6PA54X1CBha8AWc5BzaYZmlmXUjdB9jS?=
 =?iso-8859-1?Q?H9jvJ+1YGX+ys9qOLsG/luvc9KsIAQKxVhd+SxAsInyKd0CR2oafV5zM2I?=
 =?iso-8859-1?Q?1YJL9RQJD+1oxMI1X1z1mY6K1OQZHPdg/OigDRzVsznUaIYPfYYbO7XOmc?=
 =?iso-8859-1?Q?D96l0EGmFuxUfvzigbwPpBoEhEutKH8xtG1Qs9GJZXaWfAXgsEE5FRjT6t?=
 =?iso-8859-1?Q?m1zBO2rILJKKSeUmiXr/+MuHa+A/MiesukBDgBC9XR/DZofOYi4FIiX7Xh?=
 =?iso-8859-1?Q?tah+P3R35TURRXH0DJdTA8SLOc459hD/7ZK1YlsNT3EyQzjN6K4/Mnqxda?=
 =?iso-8859-1?Q?4TYf9GBRgmo+HpN/B3oneb68WwpF7+M/n+i1GNxoyFDvLMbkqKQ+ypwfQl?=
 =?iso-8859-1?Q?n8sMQYRCY42bLN6sVrZuof7h3OKiHIfTEIqR+7BXFxa/UuYX6BV2Oa2qiv?=
 =?iso-8859-1?Q?hGCiP9TfE6bfG0B189r9pzpKFHsL7cfjHPqaBNqjgJbKqdnrijeZZ4v+Sv?=
 =?iso-8859-1?Q?rHNCo8MEBpX5KIVhgGIiyv66KerqTtX95i/Yy1i5h2G4N6+vXq/kvFyN03?=
 =?iso-8859-1?Q?QOEpFM3dIc+2XjXx5wQlduKkbWPm20ZhWKxDw317ssx2zjop7HPlL9YaNx?=
 =?iso-8859-1?Q?IoLQ84Bc08Dd9oiB5bHjnl9zHzyRsKVXQWIk58zwMRT5yi3skbQXLLKf1n?=
 =?iso-8859-1?Q?xTN7AJzfAArsBEN2he2OnFXtKUPzdj8oVzlJ4kfabSPaunK+Eh1GCx72cM?=
 =?iso-8859-1?Q?zox2kybkSP9tNEao5FIrQB/qlQjmHIxTY3Y++Five7r2neYsuRBZwhXXgC?=
 =?iso-8859-1?Q?/NixLHJsmho9KtEIDwx8uUd9I6Cjx20C6BhdL+2iysk+HYhKcNhBFkk7jK?=
 =?iso-8859-1?Q?ixpQPUcYV+25UHc3FDPRVvPmqz/VvsM/rqeVQtAKD2UnNhVj5DWJzwWq9u?=
 =?iso-8859-1?Q?VC4RvXn91UoZDj7T3HjNaQb9kZrW3Xn7med5P9qwdU8qAvMyb7Ymk2a9XI?=
 =?iso-8859-1?Q?DUPEky3WpaiHLyZDVlDAHfdknDVcdHv/RTc9C9N1j31ug1OdsSZQ4rbS95?=
 =?iso-8859-1?Q?5BJkBwTheXktYRAxf5O3J/ed2+Prr0gIY7aaVa2UOuDeKMD/0CiKfjts04?=
 =?iso-8859-1?Q?MDPdY+Tec4xSfaIcAxvhSJwrUh6uf3qrRSIFPDhX5a/gx6cq2bygLpiTRU?=
 =?iso-8859-1?Q?aj8McS9j9I+Izn5HPsyrfAgceNShgPRPQIVSIRQt87J6KK+D9TeFvVzhd1?=
 =?iso-8859-1?Q?CpRNkXyGUJAugITVC28=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR07MB7984.eurprd07.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(7053199007)(7142099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?ZaGBT+u021ES6dFHbi3ckDbHm6E4HPq+8V/2ccO5flB1U/UNpd10waDLSU?=
 =?iso-8859-1?Q?hkovcdhGX0Abw8jW5ae2OVEnaOteS3IWeVvnqsVdxtIWohrRmmsLbQYbcV?=
 =?iso-8859-1?Q?65PRLAXa6JxCaI7J+DzZ72sdW7VOpbB1PufyDId7NPCp9gsZMGb8MB6GdV?=
 =?iso-8859-1?Q?bD8qb9t5tdCc5TVGvg9PxPIX9HPj+lbT2twg7693WFgtQWZHgsBvdvTQ0g?=
 =?iso-8859-1?Q?FQqzxBMqT630DW0eA3VzIhOflW1q4HkgCOQkmh4aidajU1r9cUlR3NKAE7?=
 =?iso-8859-1?Q?Evg0LqSk+rS/fbdbnmtE2AM6///vfCWdxHbEgyS/+Ksnm6ogbn0wVeRMn7?=
 =?iso-8859-1?Q?HYScy7oB+rU0GyNv5ZZBONDoqS5rEOaVz4pu2oDTAEd6VZ2jzN79aDEins?=
 =?iso-8859-1?Q?TKTSXQBJzBLGCZo4GU2OvYjH9O7MZOdQQpsHmxCLNvmcGhm6i722ey10CL?=
 =?iso-8859-1?Q?65AvfVjpbAVsfHZv/P6VIteCk84qgQ2O4Ehger9KSrO8ptBfV9NN/Qmwg3?=
 =?iso-8859-1?Q?01XGdIHWcfRp/bgnn2nvE4gj5vHS6ygHm0Bn4zuv/ydJC8NgT6xAzTZw6e?=
 =?iso-8859-1?Q?pFjFgHx0eS6ckYRfVKmfcEpox2ZSZxbm4XhMRyXM7A+Ljsa5Xorw52mHKs?=
 =?iso-8859-1?Q?OqGudODXjGiSiNQx6iduv+33qamE47bv5Hk2pYZdVDZYJ0mw65D+7U1BR1?=
 =?iso-8859-1?Q?MgXHKKsG0fUaJlvXbYW9ryYRxVvm0ytDAgQ9DdIZ4pjomgwfjje05cbRoY?=
 =?iso-8859-1?Q?CnRkdsapjHm7eA0bA/pbkqQ5Ev8XBY4gX8qeURsvPaMp6ZhhH3iROqh/O6?=
 =?iso-8859-1?Q?ZPxPQERoOHb/nFUdoxvSHh7cy8mOteteMw13vKQPnPUKz4VfJ/1R3qEMhi?=
 =?iso-8859-1?Q?AR/+/8jxR8f8vHIYqf4+WHWN/sjo8tZ3W84Y2ViXdfEigvQsfnCGhFOoCY?=
 =?iso-8859-1?Q?OMdHjCIOEQLmydqD5Dljw5ZYJ8W1gBPcsHJaq1n9VaDYitVBTAvdXXnvY9?=
 =?iso-8859-1?Q?NXLbfW484LUfxkg8J3s1ZZ52Iyh27moyk0sUBM6PLWlPGL+hBANJ9Ewmxl?=
 =?iso-8859-1?Q?iOmKF8tlE0zYJp52OCEoowGhN/AiJ3Ps1h5h3bnpiuYBvg2tPwl73A5YUe?=
 =?iso-8859-1?Q?Qe7RGp7bdPPVXx92Qqk9s2Hs303VZLfpfCrAcaJyxE8tvgKuebeomrf7/p?=
 =?iso-8859-1?Q?rNLsHfI1MmSEg4dlpx+u0wn9ouyqEjqS8b+3bogCBgluf+VJb6IucCqYy4?=
 =?iso-8859-1?Q?khBv/t5MQQsk1/fT/HjI48EWbx078+Fa2W9a6jzEtnW2SQaavS8FEx/5th?=
 =?iso-8859-1?Q?6Gq1X3NOjd/5Yt+v2sMxatrNMCOtUDi9sf/RTvezbsynpKS84Qii8kMCUQ?=
 =?iso-8859-1?Q?cSyIkQd3QuQiwfgnRrMOtM8sEeyPkxtw+/CzYOgfsl389JfGSrnL8MFFEM?=
 =?iso-8859-1?Q?AUU0X0Qgx2IwZ+ikf4V9Z9k5QGbapTxBqZRn7gdUTLb/IbVBlzPUpz94Od?=
 =?iso-8859-1?Q?MRoCZ2u+xhJK+OYTfIhIJuj1m7GjIwKVp24PQ4p4kbicN7DqnQ6g07Yq41?=
 =?iso-8859-1?Q?Dv70tlV1DMcDpgKPZgLJOdfjbFnUpj+ZQykrqyXg6R1yyPNlQieMqT4VoQ?=
 =?iso-8859-1?Q?aOhuU4pG/kEyD9bTcB4M3+b8TeCg/EK1ciUH6zkyrgUZgmKGMANvQIjYWO?=
 =?iso-8859-1?Q?YdTYsYPck2ik20v/jx5d9HLRJ4mfy22kozOa+euYdiBzUJYd5SwUv25ORg?=
 =?iso-8859-1?Q?Ke92XFR+EFzwtMeO6L37YUeE+oG8KAkthnNpBJUhNfxKG8pYK8lLZJojms?=
 =?iso-8859-1?Q?Tw0RICIAKaHOUMX+gKEp+IFTDlYExsw=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-OriginatorOrg: nokia-bell-labs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAXPR07MB7984.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 16e072f7-c76a-4672-4d79-08de63de425e
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Feb 2026 11:12:18.0414
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5d471751-9675-428d-917b-70f44f9630b0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: sktzbE2wWFDPjNQcEiuw3g2eb/C5QBb3mBwLQ5hL/JtwXMoANU/6pqtj/q7kmdeaxQFr2pr2TH+i5FdDIcqLXL7hPNNzamJejZA7RIwXUtmlwRh0cd/DLxpCQuH62VuI
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR07MB6476

> -----Original Message-----
> From: Dan Carpenter <dan.carpenter@linaro.org>
> Sent: Wednesday, February 4, 2026 11:44 AM
> To: oe-kbuild@lists.linux.dev; Chia-Yu Chang (Nokia) <chia-yu.chang@nokia=
-bell-labs.com>
> Cc: lkp@intel.com; oe-kbuild-all@lists.linux.dev; Paolo Abeni <pabeni@red=
hat.com>; Eric Dumazet <edumazet@google.com>
> Subject: [linux-next:master 11349/11582] net/ipv4/tcp_output.c:754 tcp_op=
tions_write() error: we previously assumed 'tp' could be null (see line 722=
)
>
> [You don't often get email from dan.carpenter@linaro.org. Learn why this =
is important at https://aka.ms/LearnAboutSenderIdentification ]
>
> CAUTION: This is an external email. Please be very careful when clicking =
links or opening attachments. See the URL nok.it/ext for additional informa=
tion.
>
>
>
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.g=
it master
> head:   5c009020744fe129e4728e71c44a6c7816c9105e
> commit: 1247fb19cafee6f9fa350ae378e4e1e9965cc253 [11349/11582] tcp: accec=
n: detect loss ACK w/ AccECN option and add TCP_ACCECN_OPTION_PERSIST
> config: s390-randconfig-r071-20260204 (https://download.01.org/0day-ci/ar=
chive/20260204/202602041310.ZBuXDXC5-lkp@intel.com/config)
> compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9=
b8addffa70cee5b2acc5454712d9cf78ce45710)
> smatch version: v0.5.0-8994-gd50c5a4c
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> | Closes:
> | https://lore/
> | .kernel.org%2Fr%2F202602041310.ZBuXDXC5-lkp%40intel.com%2F&data=3D05%7C=
0
> | 2%7Cchia-yu.chang%40nokia-bell-labs.com%7Cecb42399c5e74227fcb508de63da
> | 4d74%7C5d4717519675428d917b70f44f9630b0%7C0%7C0%7C639057986434707286%7
> | CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlA
> | iOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=3Dtc44=
h
> | jBS%2BmT08Vn8wvYKBc14jqNghUO1q0EooGIuLUI%3D&reserved=3D0
>
> smatch warnings:
> net/ipv4/tcp_output.c:754 tcp_options_write() error: we previously assume=
d 'tp' could be null (see line 722)
>
> vim +/tp +754 net/ipv4/tcp_output.c
>
> 7425627b2b2cd6 Nathan Chancellor     2023-11-06  634  static void tcp_opt=
ions_write(struct tcphdr *th, struct tcp_sock *tp,
> 7425627b2b2cd6 Nathan Chancellor     2023-11-06  635                     =
     const struct tcp_request_sock *tcprsk,
> 7425627b2b2cd6 Nathan Chancellor     2023-11-06  636                     =
     struct tcp_out_options *opts,
> 7425627b2b2cd6 Nathan Chancellor     2023-11-06  637                     =
     struct tcp_key *key)
> 7425627b2b2cd6 Nathan Chancellor     2023-11-06  638  {
> b5e74132dfbe60 Ilpo J=E4rvinen         2025-09-16  639    u8 leftover_hig=
hbyte =3D TCPOPT_NOP; /* replace 1st NOP if avail */
> b5e74132dfbe60 Ilpo J=E4rvinen         2025-09-16  640    u8 leftover_low=
byte =3D TCPOPT_NOP;  /* replace 2nd NOP in succession */
> 7425627b2b2cd6 Nathan Chancellor     2023-11-06  641    __be32 *ptr =3D (=
__be32 *)(th + 1);
> 7425627b2b2cd6 Nathan Chancellor     2023-11-06  642    u16 options =3D o=
pts->options;    /* mungable copy */
> 7425627b2b2cd6 Nathan Chancellor     2023-11-06  643
> 7425627b2b2cd6 Nathan Chancellor     2023-11-06  644    if (tcp_key_is_md=
5(key)) {
> 7425627b2b2cd6 Nathan Chancellor     2023-11-06  645            *ptr++ =
=3D htonl((TCPOPT_NOP << 24) | (TCPOPT_NOP << 16) |
> 7425627b2b2cd6 Nathan Chancellor     2023-11-06  646                     =
      (TCPOPT_MD5SIG << 8) | TCPOLEN_MD5SIG);
> 7425627b2b2cd6 Nathan Chancellor     2023-11-06  647            /* overlo=
ad cookie hash location */
> 7425627b2b2cd6 Nathan Chancellor     2023-11-06  648            opts->has=
h_location =3D (__u8 *)ptr;
> 7425627b2b2cd6 Nathan Chancellor     2023-11-06  649            ptr +=3D =
4;
> 7425627b2b2cd6 Nathan Chancellor     2023-11-06  650    } else if (tcp_ke=
y_is_ao(key)) {
> 7425627b2b2cd6 Nathan Chancellor     2023-11-06  651            ptr =3D p=
rocess_tcp_ao_options(tp, tcprsk, opts, key, ptr);
> 33ad798c924b4a Adam Langley          2008-07-19  652    }
> fd6149d332973b Ilpo J=E4rvinen         2008-10-23  653    if (unlikely(op=
ts->mss)) {
> fd6149d332973b Ilpo J=E4rvinen         2008-10-23  654            *ptr++ =
=3D htonl((TCPOPT_MSS << 24) |
> fd6149d332973b Ilpo J=E4rvinen         2008-10-23  655                   =
        (TCPOLEN_MSS << 16) |
> fd6149d332973b Ilpo J=E4rvinen         2008-10-23  656                   =
        opts->mss);
> fd6149d332973b Ilpo J=E4rvinen         2008-10-23  657    }
> fd6149d332973b Ilpo J=E4rvinen         2008-10-23  658
> bd0388ae770750 William Allen Simpson 2009-12-02  659    if (likely(OPTION=
_TS & options)) {
> bd0388ae770750 William Allen Simpson 2009-12-02  660            if (unlik=
ely(OPTION_SACK_ADVERTISE & options)) {
> 33ad798c924b4a Adam Langley          2008-07-19  661                    *=
ptr++ =3D htonl((TCPOPT_SACK_PERM << 24) |
> 33ad798c924b4a Adam Langley          2008-07-19  662                     =
              (TCPOLEN_SACK_PERM << 16) |
> 33ad798c924b4a Adam Langley          2008-07-19  663                     =
              (TCPOPT_TIMESTAMP << 8) |
> 33ad798c924b4a Adam Langley          2008-07-19  664                     =
              TCPOLEN_TIMESTAMP);
> bd0388ae770750 William Allen Simpson 2009-12-02  665                    o=
ptions &=3D ~OPTION_SACK_ADVERTISE;
> 33ad798c924b4a Adam Langley          2008-07-19  666            } else {
> 496c98dff8e353 YOSHIFUJI Hideaki     2006-10-10  667                    *=
ptr++ =3D htonl((TCPOPT_NOP << 24) |
> 40efc6fa179f44 Stephen Hemminger     2006-01-03  668                     =
              (TCPOPT_NOP << 16) |
> 40efc6fa179f44 Stephen Hemminger     2006-01-03  669                     =
              (TCPOPT_TIMESTAMP << 8) |
> 40efc6fa179f44 Stephen Hemminger     2006-01-03  670                     =
              TCPOLEN_TIMESTAMP);
> 40efc6fa179f44 Stephen Hemminger     2006-01-03  671            }
> 33ad798c924b4a Adam Langley          2008-07-19  672            *ptr++ =
=3D htonl(opts->tsval);
> 33ad798c924b4a Adam Langley          2008-07-19  673            *ptr++ =
=3D htonl(opts->tsecr);
> 33ad798c924b4a Adam Langley          2008-07-19  674    }
> 33ad798c924b4a Adam Langley          2008-07-19  675
> b5e74132dfbe60 Ilpo J=E4rvinen         2025-09-16  676    if (OPTION_ACCE=
CN & options) {
> b5e74132dfbe60 Ilpo J=E4rvinen         2025-09-16  677            const u=
32 *ecn_bytes =3D opts->use_synack_ecn_bytes ?
> b5e74132dfbe60 Ilpo J=E4rvinen         2025-09-16  678                   =
                synack_ecn_bytes :
> b5e74132dfbe60 Ilpo J=E4rvinen         2025-09-16  679                   =
                tp->received_ecn_bytes;

Do you mean here tp could be NULL?

It looks likes due to older AccECN patch (NOT the patch mentioned in this e=
mail), I can make a patch - but please indicate which tree shall be patch g=
o (net-next?).

> b5e74132dfbe60 Ilpo J=E4rvinen         2025-09-16  680            const u=
8 ect0_idx =3D INET_ECN_ECT_0 - 1;
> b5e74132dfbe60 Ilpo J=E4rvinen         2025-09-16  681            const u=
8 ect1_idx =3D INET_ECN_ECT_1 - 1;
> b5e74132dfbe60 Ilpo J=E4rvinen         2025-09-16  682            const u=
8 ce_idx =3D INET_ECN_CE - 1;
> b5e74132dfbe60 Ilpo J=E4rvinen         2025-09-16  683            u32 e0b=
;
> b5e74132dfbe60 Ilpo J=E4rvinen         2025-09-16  684            u32 e1b=
;
> b5e74132dfbe60 Ilpo J=E4rvinen         2025-09-16  685            u32 ceb=
;
> b5e74132dfbe60 Ilpo J=E4rvinen         2025-09-16  686            u8 len;
> b5e74132dfbe60 Ilpo J=E4rvinen         2025-09-16  687
> b5e74132dfbe60 Ilpo J=E4rvinen         2025-09-16  688            e0b =3D=
 ecn_bytes[ect0_idx] + TCP_ACCECN_E0B_INIT_OFFSET;
> b5e74132dfbe60 Ilpo J=E4rvinen         2025-09-16  689            e1b =3D=
 ecn_bytes[ect1_idx] + TCP_ACCECN_E1B_INIT_OFFSET;
> b5e74132dfbe60 Ilpo J=E4rvinen         2025-09-16  690            ceb =3D=
 ecn_bytes[ce_idx] + TCP_ACCECN_CEB_INIT_OFFSET;
> b5e74132dfbe60 Ilpo J=E4rvinen         2025-09-16  691            len =3D=
 TCPOLEN_ACCECN_BASE +
> b5e74132dfbe60 Ilpo J=E4rvinen         2025-09-16  692                  o=
pts->num_accecn_fields * TCPOLEN_ACCECN_PERFIELD;
> b5e74132dfbe60 Ilpo J=E4rvinen         2025-09-16  693
> b5e74132dfbe60 Ilpo J=E4rvinen         2025-09-16  694            if (opt=
s->num_accecn_fields =3D=3D 2) {
> b5e74132dfbe60 Ilpo J=E4rvinen         2025-09-16  695                   =
 *ptr++ =3D htonl((TCPOPT_ACCECN1 << 24) | (len << 16) |
> b5e74132dfbe60 Ilpo J=E4rvinen         2025-09-16  696                   =
                ((e1b >> 8) & 0xffff));
> b5e74132dfbe60 Ilpo J=E4rvinen         2025-09-16  697                   =
 *ptr++ =3D htonl(((e1b & 0xff) << 24) |
> b5e74132dfbe60 Ilpo J=E4rvinen         2025-09-16  698                   =
                (ceb & 0xffffff));
> b5e74132dfbe60 Ilpo J=E4rvinen         2025-09-16  699            } else =
if (opts->num_accecn_fields =3D=3D 1) {
> b5e74132dfbe60 Ilpo J=E4rvinen         2025-09-16  700                   =
 *ptr++ =3D htonl((TCPOPT_ACCECN1 << 24) | (len << 16) |
> b5e74132dfbe60 Ilpo J=E4rvinen         2025-09-16  701                   =
                ((e1b >> 8) & 0xffff));
> b5e74132dfbe60 Ilpo J=E4rvinen         2025-09-16  702                   =
 leftover_highbyte =3D e1b & 0xff;
> b5e74132dfbe60 Ilpo J=E4rvinen         2025-09-16  703                   =
 leftover_lowbyte =3D TCPOPT_NOP;
> b5e74132dfbe60 Ilpo J=E4rvinen         2025-09-16  704            } else =
if (opts->num_accecn_fields =3D=3D 0) {
> b5e74132dfbe60 Ilpo J=E4rvinen         2025-09-16  705                   =
 leftover_highbyte =3D TCPOPT_ACCECN1;
> b5e74132dfbe60 Ilpo J=E4rvinen         2025-09-16  706                   =
 leftover_lowbyte =3D len;
> b5e74132dfbe60 Ilpo J=E4rvinen         2025-09-16  707            } else =
if (opts->num_accecn_fields =3D=3D 3) {
> b5e74132dfbe60 Ilpo J=E4rvinen         2025-09-16  708                   =
 *ptr++ =3D htonl((TCPOPT_ACCECN1 << 24) | (len << 16) |
> b5e74132dfbe60 Ilpo J=E4rvinen         2025-09-16  709                   =
                ((e1b >> 8) & 0xffff));
> b5e74132dfbe60 Ilpo J=E4rvinen         2025-09-16  710                   =
 *ptr++ =3D htonl(((e1b & 0xff) << 24) |
> b5e74132dfbe60 Ilpo J=E4rvinen         2025-09-16  711                   =
                (ceb & 0xffffff));
> b5e74132dfbe60 Ilpo J=E4rvinen         2025-09-16  712                   =
 *ptr++ =3D htonl(((e0b & 0xffffff) << 8) |
> b5e74132dfbe60 Ilpo J=E4rvinen         2025-09-16  713                   =
                TCPOPT_NOP);
> b5e74132dfbe60 Ilpo J=E4rvinen         2025-09-16  714            }
> aa55a7dde7ec50 Chia-Yu Chang         2025-09-16  715            if (tp) {
>
> tp can be NULL here

Seems we already check via "if(tp)" here

>
> b5e74132dfbe60 Ilpo J=E4rvinen         2025-09-16  716                   =
 tp->accecn_minlen =3D 0;
> aa55a7dde7ec50 Chia-Yu Chang         2025-09-16  717                    t=
p->accecn_opt_tstamp =3D tp->tcp_mstamp;
> 1247fb19cafee6 Chia-Yu Chang         2026-01-31  718                    t=
p->accecn_opt_sent_w_dsack =3D tp->rx_opt.dsack;
> aa55a7dde7ec50 Chia-Yu Chang         2025-09-16  719                    i=
f (tp->accecn_opt_demand)
> aa55a7dde7ec50 Chia-Yu Chang         2025-09-16  720                     =
       tp->accecn_opt_demand--;
> aa55a7dde7ec50 Chia-Yu Chang         2025-09-16  721            }
> 1247fb19cafee6 Chia-Yu Chang         2026-01-31 @722    } else if (tp) {
>
> And here

Seems we also checked via "else if(tp)" here

>
> 1247fb19cafee6 Chia-Yu Chang         2026-01-31  723            tp->accec=
n_opt_sent_w_dsack =3D 0;
> b5e74132dfbe60 Ilpo J=E4rvinen         2025-09-16  724    }
> b5e74132dfbe60 Ilpo J=E4rvinen         2025-09-16  725
> bd0388ae770750 William Allen Simpson 2009-12-02  726    if (unlikely(OPTI=
ON_SACK_ADVERTISE & options)) {
> b5e74132dfbe60 Ilpo J=E4rvinen         2025-09-16  727            *ptr++ =
=3D htonl((leftover_highbyte << 24) |
> b5e74132dfbe60 Ilpo J=E4rvinen         2025-09-16  728                   =
        (leftover_lowbyte << 16) |
> 33ad798c924b4a Adam Langley          2008-07-19  729                     =
      (TCPOPT_SACK_PERM << 8) |
> 33ad798c924b4a Adam Langley          2008-07-19  730                     =
      TCPOLEN_SACK_PERM);
> b5e74132dfbe60 Ilpo J=E4rvinen         2025-09-16  731            leftove=
r_highbyte =3D TCPOPT_NOP;
> b5e74132dfbe60 Ilpo J=E4rvinen         2025-09-16  732            leftove=
r_lowbyte =3D TCPOPT_NOP;
> 33ad798c924b4a Adam Langley          2008-07-19  733    }
> 33ad798c924b4a Adam Langley          2008-07-19  734
> bd0388ae770750 William Allen Simpson 2009-12-02  735    if (unlikely(OPTI=
ON_WSCALE & options)) {
> b5e74132dfbe60 Ilpo J=E4rvinen         2025-09-16  736            u8 high=
byte =3D TCPOPT_NOP;
> b5e74132dfbe60 Ilpo J=E4rvinen         2025-09-16  737
> b5e74132dfbe60 Ilpo J=E4rvinen         2025-09-16  738            /* Do n=
ot split the leftover 2-byte to fit into a single
> b5e74132dfbe60 Ilpo J=E4rvinen         2025-09-16  739             * NOP,=
 i.e., replace this NOP only when 1 byte is leftover
> b5e74132dfbe60 Ilpo J=E4rvinen         2025-09-16  740             * with=
in leftover_highbyte.
> b5e74132dfbe60 Ilpo J=E4rvinen         2025-09-16  741             */
> b5e74132dfbe60 Ilpo J=E4rvinen         2025-09-16  742            if (unl=
ikely(leftover_highbyte !=3D TCPOPT_NOP &&
> b5e74132dfbe60 Ilpo J=E4rvinen         2025-09-16  743                   =
      leftover_lowbyte =3D=3D TCPOPT_NOP)) {
> b5e74132dfbe60 Ilpo J=E4rvinen         2025-09-16  744                   =
 highbyte =3D leftover_highbyte;
> b5e74132dfbe60 Ilpo J=E4rvinen         2025-09-16  745                   =
 leftover_highbyte =3D TCPOPT_NOP;
> b5e74132dfbe60 Ilpo J=E4rvinen         2025-09-16  746            }
> b5e74132dfbe60 Ilpo J=E4rvinen         2025-09-16  747            *ptr++ =
=3D htonl((highbyte << 24) |
> 33ad798c924b4a Adam Langley          2008-07-19  748                     =
      (TCPOPT_WINDOW << 16) |
> 33ad798c924b4a Adam Langley          2008-07-19  749                     =
      (TCPOLEN_WINDOW << 8) |
> 33ad798c924b4a Adam Langley          2008-07-19  750                     =
      opts->ws);
> 33ad798c924b4a Adam Langley          2008-07-19  751    }
> 33ad798c924b4a Adam Langley          2008-07-19  752
> 33ad798c924b4a Adam Langley          2008-07-19  753    if (unlikely(opts=
->num_sack_blocks)) {
> 33ad798c924b4a Adam Langley          2008-07-19 @754            struct tc=
p_sack_block *sp =3D tp->rx_opt.dsack ?
>
> Unchecked dereference

This also looks due to older patch (not the one indicated in this email) an=
d not related to AccECN.

Chia-Yu
