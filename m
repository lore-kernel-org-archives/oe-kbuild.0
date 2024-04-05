Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11020002.outbound.protection.outlook.com [52.101.193.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D60616F84A;
	Fri,  5 Apr 2024 15:19:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=52.101.193.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712330369; cv=none; b=ruPfJ2M6wSP4AVMjB4poxhdJ0BC4qSs1f3BacMS8+9G/KDD9kg0FDcGdKjGw1luAPP/2SAcd6PQepc3aXEh9LY2AOW+iBXt4Lf5n3+1F9JSK1vEbf8M3HGBuFTIv1JfBtEWOb3VB3vkyIaF9EgCeDC8kM4QlATsxQCDJVU1yRjY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712330369; c=relaxed/simple;
	bh=3MfB7U/+rMZijqgvmf3mHH8ALSj1Lwb2AOrJXwzGNDo=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=jzgK04F9oQXmtd6LRom+kqIv84S6qh4muV0hqsfEFbUwzpiWOnrFIjAnKunGyB2oroNjK58tk/rRMkmr4xP51eoeafPdHbow75lAeLq+cA7X8CtkoEe6zMm5bVc6gd1VlQRfXN8Lhm6FO/uMX/qIxLy9PRF6cLJvJK1/H+ZVdpg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microsoft.com; spf=pass smtp.mailfrom=microsoft.com; dkim=pass (1024-bit key) header.d=microsoft.com header.i=@microsoft.com header.b=P8nZLTmL; arc=none smtp.client-ip=52.101.193.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microsoft.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microsoft.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=microsoft.com header.i=@microsoft.com header.b="P8nZLTmL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vDjec+NKYErYn/GYlHD4fUK9//ul7+og5UTHYw7Eb8c=;
 b=P8nZLTmLr3pkq0I8vzBSM6scIn5mCJXOfeHXaFcmlo7PGL4pP9VPBm4hdcHMWd/0vG1VPkOEpecWvKtyUbfmHqw5RJmYLHZgrF0uNWEjUPM6TuyYiJKbVr8PxTgOGGQ4RoRkL/pjWMuMVS7z8h7oWbcXppDJ/wg9MMbMRHVBMhw=
Received: from SA0PR21MB1898.namprd21.prod.outlook.com (2603:10b6:806:ed::11)
 by MN2PR21MB1469.namprd21.prod.outlook.com (2603:10b6:208:203::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.9; Fri, 5 Apr
 2024 15:19:23 +0000
Received: from SA0PR21MB1898.namprd21.prod.outlook.com
 ([fe80::1657:31fa:bcd3:e49f]) by SA0PR21MB1898.namprd21.prod.outlook.com
 ([fe80::1657:31fa:bcd3:e49f%5]) with mapi id 15.20.7472.002; Fri, 5 Apr 2024
 15:19:23 +0000
From: Steven French <Steven.French@microsoft.com>
To: Dan Carpenter <dan.carpenter@linaro.org>, "oe-kbuild@lists.linux.dev"
	<oe-kbuild@lists.linux.dev>, Ritvik Budhiraja <rbudhiraja@microsoft.com>
CC: "lkp@intel.com" <lkp@intel.com>, "oe-kbuild-all@lists.linux.dev"
	<oe-kbuild-all@lists.linux.dev>
Subject: RE: [EXTERNAL] [linux-next:master 3307/3504] fs/smb/client/file.c:619
 serverclose_work() error: uninitialized symbol 'rc'.
Thread-Topic: [EXTERNAL] [linux-next:master 3307/3504]
 fs/smb/client/file.c:619 serverclose_work() error: uninitialized symbol 'rc'.
Thread-Index: AQHahyS6fWq0Z4yAdUmBokbGb1Hp7LFZyohA
Date: Fri, 5 Apr 2024 15:19:23 +0000
Message-ID:
 <SA0PR21MB189860639175A2577E444F48E4032@SA0PR21MB1898.namprd21.prod.outlook.com>
References: <422ce838-05f9-4e02-b852-5274faa997be@moroto.mountain>
In-Reply-To: <422ce838-05f9-4e02-b852-5274faa997be@moroto.mountain>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_ActionId=43909479-4510-480c-b333-fe797567bf56;MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_ContentBits=0;MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Enabled=true;MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Method=Standard;MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Name=Internal;MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SetDate=2024-04-05T15:17:44Z;MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SiteId=72f988bf-86f1-41af-91ab-2d7cd011db47;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA0PR21MB1898:EE_|MN2PR21MB1469:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 LfchIlAYOxAcYdDAogG9U0nRgVOWB4j2OwaOhyMb4iToGeTkv/CS2GztN/toAqz8JLxu1bwGWaiWPXUIsWlQqLtVBkJV3Nl8GRGNzhazAgsJt1krFq9USjiFkVdq/ChzGNDgvR/hjK4HbmH6Ftjty2R2bzDe8yWqREEARrL10aWNGllylLEWljWe9vq+0eBEQ5uW8yb2BRIq3SCZizKY4LibQLNFNkSqmIoi2zwfUMmWSLqTTO9HshfGnSSFRVbE2joNW9qdB3Yvvhp89Laq6w+dcYdnf8EAkHEFlQlSDNQPM5sQqYFGE04QRJHngPq2OfGicFKuqpR5GPmaXoOx6NNT5KcHAOndIL+t66e4TjpXZReQCFx+CYIy9WcNPbelx6I+4c3pdKzvjHD+Pq8vZmnq5t+VSoOLSDIKQQXFfKP9NIcsI/uMgg5+cmmJP/SnjaJLwgUiv+/RNqWmy6fJE/tQqAbjnJhPMdFygW8ffWkLFs9r+YrahYnn5J4Ko3JI5op0D+NUpPsH/HZsGMamMSfub2zQtJHICDByDS7/q4ziFpJZxOp1N0LOYizPMeKU3EAxbUUWheWf6N/bPCZkgvH9oPzomPxOygRkqAnxk/c=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA0PR21MB1898.namprd21.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(366007)(1800799015);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?CjSPqV6cnuHetnnL3sHGSUQfqwlsUiGy5iUs3Q5ugrtXSR11CDQxf4T4J77v?=
 =?us-ascii?Q?QtaoUIp/BDYNjIdOikSRzX/m51C4uUjLcaxlEoZrJmEnp5RqssZ3N2UdZlrl?=
 =?us-ascii?Q?Db5/i000QYlBDkMNwemqoZ7XDmE5J9E3CSELjG0Z+lDqDeAljv6bV32++Um1?=
 =?us-ascii?Q?BYhrDBp2+zjMblosePItYbVyFszjG2PP/kTOj1TS6zmL0bEMFgSOb30GXwOn?=
 =?us-ascii?Q?jA9Q0MyckOYzgWMAB2dyEWM6dN0j7gAI9YACwXEpjtvGluR9y0ZIH/VO2LLT?=
 =?us-ascii?Q?JD/KfdSkbiGp2bAcn5mCMlnvaGJhU4IibfICc9NWUfQBIzDrwZH2W42Ncdje?=
 =?us-ascii?Q?LyBL9dVqgSA9g1UINJHaDFHPBFf6bH7kj7uw5i90S+tAKFcrdTQhEC3bP0L2?=
 =?us-ascii?Q?KBvdb6adZdSwSlfeMVzWt4mvSmQ/gpDwyZYR400/EkxrqVTg0PAKswuZhDmV?=
 =?us-ascii?Q?YeLkrnbrcvdpikleBSyEz90MVhda+AXoWdm5MJ+WJ8cXwvmqVkVzfCEc7PgS?=
 =?us-ascii?Q?Dzqa8rvNY1MwUZiThREH0ecf4Yjj0KbmHXUPpOSinhBDHJD8EVTcxEZ6Glm4?=
 =?us-ascii?Q?zTRQmt5hWbPBq7NRBNFSj105inF84zhkLMozLZOOkFRwvB8gI1JSQRgnpiUy?=
 =?us-ascii?Q?9/IabK/2bXocRvqS98HpzV1/Ia/DYWQKpyGMhKShoJEwODUlPt4EYFdS1e7R?=
 =?us-ascii?Q?EhzX7CYs1+Rr8mRH0WvPbB6x93YXbgu4/rI6wDlW0beMhb6DrkVsWyU6wVEM?=
 =?us-ascii?Q?HmWfdTwhdDy9ZXVaGCtfajFYrxwIKeJg/fnJ0vcb3xQlMotx5RW0q2JUkyj0?=
 =?us-ascii?Q?SY5bLFMWsvMY7cWET6wBdibgP/REFv8mpcRWVYikdBxxCU4pp8daGKaMbNHe?=
 =?us-ascii?Q?9FcUKW/hhJlqjxYm5cD0JoSkj4X6Qm0E/rYUX1oI1FbopDrKL+33oAyt+q/J?=
 =?us-ascii?Q?oquXqCHFG6kW+HnCS3HKgHlgWEPZ/YmW/gEFUUb/+XeL6BRYDMCqp1ugyRs1?=
 =?us-ascii?Q?ZJXG6+31DJe0Vuj2Div9t6N5YXx9HLRbM1H7E3eN5iISQDBTURAFxJYUW2Bv?=
 =?us-ascii?Q?R3eXQUABzEPdf7E1GxQ1eOavBlEx+UvAxrwyA52sPBlEJGStSpmu9I0z5KDA?=
 =?us-ascii?Q?LvUjuZRajesNdgpq8KSY4HEiZ2p3zNmt0n57xyjVST4L1MKkHh4KIndTppFm?=
 =?us-ascii?Q?4iPfYxUUlNTzqlUvxeuJ51RHGNnIwq4LP0gw/7CXp03Doi5PeMGbrjB5FCww?=
 =?us-ascii?Q?SJUBy9z8v4NTyLzlUSvfmhjzZZNJ1UCun9Ke0tecUTqYyRMsB/n5S8euokQB?=
 =?us-ascii?Q?G+jlhEnD341/q+3ZynK6MtJAhFORGxR8FLZJuy8d4dS7tcT+ez08qUwdM5Jt?=
 =?us-ascii?Q?kMLXVLGzm9ELhtUPY30ZqNcLTgKo4pWWzDGkBE+hSmP58uKDFMDw6x2Zt8rY?=
 =?us-ascii?Q?dl+xSeMCwp2bGixPK2eO0F//PXG7cEN8WrISj9SU0Oq/DQGv9wvNzi1newWx?=
 =?us-ascii?Q?3vUosvfFbX4DwjrduS50EEP1k/rdheUCrQCecz9TuQXfLQMKAtdffAeCng2c?=
 =?us-ascii?Q?/AvhDlpJZCl9B/+gx06BYNQWAsle3DGdx7fC79LUrMqg+AlRkiWWZ2T3RCV9?=
 =?us-ascii?Q?/Ry06MUnHzavJ8a6OErRHNb4BG35TPFvGa45c/WzEX8D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-OriginatorOrg: microsoft.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA0PR21MB1898.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: caa2a7c3-21e7-4818-3bd4-08dc5583c626
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Apr 2024 15:19:23.2890
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72f988bf-86f1-41af-91ab-2d7cd011db47
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gut7HaW0EE9LwoazfrQKE7ToAH5zyXIJuZDY0GM61gckgC3NE9Yam6FWqAuV+Tc3eSCH8PoyQ2zXCHYRizeVOQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR21MB1469

Both of these have already been fixed in current for-next

-----Original Message-----
From: Dan Carpenter <dan.carpenter@linaro.org>
Sent: Friday, April 5, 2024 1:44 AM
To: oe-kbuild@lists.linux.dev; Ritvik Budhiraja <rbudhiraja@microsoft.com>
Cc: lkp@intel.com; oe-kbuild-all@lists.linux.dev; Steven French <Steven.Fre=
nch@microsoft.com>
Subject: [EXTERNAL] [linux-next:master 3307/3504] fs/smb/client/file.c:619 =
serverclose_work() error: uninitialized symbol 'rc'.

[You don't often get email from dan.carpenter@linaro.org. Learn why this is=
 important at https://aka.ms/LearnAboutSenderIdentification ]

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   727900b675b749c40ba1f6669c7ae5eb7eb8e837
commit: a423dcbdabf457c0fff3669b0b20708d287c92c2 [3307/3504] smb3: retrying=
 on failed server close
config: x86_64-randconfig-161-20240403 (https://download.01.org/0day-ci/arc=
hive/20240403/202404031415.cIBwV2aU-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes:
| https://lore/
| .kernel.org%2Fr%2F202404031415.cIBwV2aU-lkp%40intel.com%2F&data=3D05%7C0
| 2%7CSteven.French%40microsoft.com%7C6ebe2178d38640aef20608dc553bdadd%7
| C72f988bf86f141af91ab2d7cd011db47%7C1%7C0%7C638478962782506582%7CUnkno
| wn%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiL
| CJXVCI6Mn0%3D%7C0%7C%7C%7C&sdata=3DxmEQ7tFaEJH%2B5mnPaGhfYafRku3v5p0TLVP
| 4enG78PU%3D&reserved=3D0

New smatch warnings:
fs/smb/client/file.c:619 serverclose_work() error: uninitialized symbol 'rc=
'.
fs/smb/client/file.c:732 _cifsFileInfo_put() error: uninitialized symbol 'r=
c'.

Old smatch warnings:
fs/smb/client/file.c:5050 cifs_oplock_break() warn: variable dereferenced b=
efore check 'inode' (see line 5021)

vim +/rc +619 fs/smb/client/file.c

a423dcbdabf457 fs/smb/client/file.c Ritvik Budhiraja 2024-04-02  601  void =
serverclose_work(struct work_struct *work)
a423dcbdabf457 fs/smb/client/file.c Ritvik Budhiraja 2024-04-02  602  {
a423dcbdabf457 fs/smb/client/file.c Ritvik Budhiraja 2024-04-02  603    str=
uct cifsFileInfo *cifs_file =3D container_of(work,
a423dcbdabf457 fs/smb/client/file.c Ritvik Budhiraja 2024-04-02  604       =
             struct cifsFileInfo, serverclose);
a423dcbdabf457 fs/smb/client/file.c Ritvik Budhiraja 2024-04-02  605
a423dcbdabf457 fs/smb/client/file.c Ritvik Budhiraja 2024-04-02  606    str=
uct cifs_tcon *tcon =3D tlink_tcon(cifs_file->tlink);
a423dcbdabf457 fs/smb/client/file.c Ritvik Budhiraja 2024-04-02  607
a423dcbdabf457 fs/smb/client/file.c Ritvik Budhiraja 2024-04-02  608    str=
uct TCP_Server_Info *server =3D tcon->ses->server;
a423dcbdabf457 fs/smb/client/file.c Ritvik Budhiraja 2024-04-02  609    int=
 rc;
a423dcbdabf457 fs/smb/client/file.c Ritvik Budhiraja 2024-04-02  610    int=
 retries =3D 0;
a423dcbdabf457 fs/smb/client/file.c Ritvik Budhiraja 2024-04-02  611    int=
 MAX_RETRIES =3D 4;
a423dcbdabf457 fs/smb/client/file.c Ritvik Budhiraja 2024-04-02  612
a423dcbdabf457 fs/smb/client/file.c Ritvik Budhiraja 2024-04-02  613    do =
{
a423dcbdabf457 fs/smb/client/file.c Ritvik Budhiraja 2024-04-02  614       =
     if (server->ops->close_getattr)
a423dcbdabf457 fs/smb/client/file.c Ritvik Budhiraja 2024-04-02  615       =
             rc =3D server->ops->close_getattr(0, tcon, cifs_file);
a423dcbdabf457 fs/smb/client/file.c Ritvik Budhiraja 2024-04-02  616       =
     else if (server->ops->close)
a423dcbdabf457 fs/smb/client/file.c Ritvik Budhiraja 2024-04-02  617       =
             rc =3D server->ops->close(0, tcon, &cifs_file->fid);

rc not intialized on else path

a423dcbdabf457 fs/smb/client/file.c Ritvik Budhiraja 2024-04-02  618
a423dcbdabf457 fs/smb/client/file.c Ritvik Budhiraja 2024-04-02 @619       =
     if (rc =3D=3D -EBUSY || rc =3D=3D -EAGAIN) {
a423dcbdabf457 fs/smb/client/file.c Ritvik Budhiraja 2024-04-02  620       =
             retries++;
a423dcbdabf457 fs/smb/client/file.c Ritvik Budhiraja 2024-04-02  621       =
             msleep(250);
a423dcbdabf457 fs/smb/client/file.c Ritvik Budhiraja 2024-04-02  622       =
     }
a423dcbdabf457 fs/smb/client/file.c Ritvik Budhiraja 2024-04-02  623    } w=
hile ((rc =3D=3D -EBUSY || rc =3D=3D -EAGAIN) && (retries < MAX_RETRIES)
a423dcbdabf457 fs/smb/client/file.c Ritvik Budhiraja 2024-04-02  624    );
a423dcbdabf457 fs/smb/client/file.c Ritvik Budhiraja 2024-04-02  625
a423dcbdabf457 fs/smb/client/file.c Ritvik Budhiraja 2024-04-02  626    if =
(retries =3D=3D MAX_RETRIES)
a423dcbdabf457 fs/smb/client/file.c Ritvik Budhiraja 2024-04-02  627       =
     pr_warn("Serverclose failed %d times, giving up\n", MAX_RETRIES);
a423dcbdabf457 fs/smb/client/file.c Ritvik Budhiraja 2024-04-02  628
a423dcbdabf457 fs/smb/client/file.c Ritvik Budhiraja 2024-04-02  629    if =
(cifs_file->offload)
a423dcbdabf457 fs/smb/client/file.c Ritvik Budhiraja 2024-04-02  630       =
     queue_work(fileinfo_put_wq, &cifs_file->put);
a423dcbdabf457 fs/smb/client/file.c Ritvik Budhiraja 2024-04-02  631    els=
e
a423dcbdabf457 fs/smb/client/file.c Ritvik Budhiraja 2024-04-02  632       =
     cifsFileInfo_put_final(cifs_file);
a423dcbdabf457 fs/smb/client/file.c Ritvik Budhiraja 2024-04-02  633  }
a423dcbdabf457 fs/smb/client/file.c Ritvik Budhiraja 2024-04-02  634
b98749cac4a695 fs/cifs/file.c       Aurelien Aptel   2019-03-29  635  /**
b98749cac4a695 fs/cifs/file.c       Aurelien Aptel   2019-03-29  636   * ci=
fsFileInfo_put - release a reference of file priv data
b98749cac4a695 fs/cifs/file.c       Aurelien Aptel   2019-03-29  637   *
b98749cac4a695 fs/cifs/file.c       Aurelien Aptel   2019-03-29  638   * Al=
ways potentially wait for oplock handler. See _cifsFileInfo_put().
607dfc79c37a0e fs/cifs/file.c       Steve French     2020-12-12  639   *
607dfc79c37a0e fs/cifs/file.c       Steve French     2020-12-12  640   * @c=
ifs_file:    cifs/smb3 specific info (eg refcounts) for an open file
cdff08e76612e5 fs/cifs/file.c       Steve French     2010-10-21  641   */
b33879aa834ebe fs/cifs/file.c       Jeff Layton      2010-10-15  642  void =
cifsFileInfo_put(struct cifsFileInfo *cifs_file)
b98749cac4a695 fs/cifs/file.c       Aurelien Aptel   2019-03-29  643  {
32546a9586aa45 fs/cifs/file.c       Ronnie Sahlberg  2019-11-03  644    _ci=
fsFileInfo_put(cifs_file, true, true);
b98749cac4a695 fs/cifs/file.c       Aurelien Aptel   2019-03-29  645  }
b98749cac4a695 fs/cifs/file.c       Aurelien Aptel   2019-03-29  646
b98749cac4a695 fs/cifs/file.c       Aurelien Aptel   2019-03-29  647  /**
b98749cac4a695 fs/cifs/file.c       Aurelien Aptel   2019-03-29  648   * _c=
ifsFileInfo_put - release a reference of file priv data
b98749cac4a695 fs/cifs/file.c       Aurelien Aptel   2019-03-29  649   *
b98749cac4a695 fs/cifs/file.c       Aurelien Aptel   2019-03-29  650   * Th=
is may involve closing the filehandle @cifs_file out on the
32546a9586aa45 fs/cifs/file.c       Ronnie Sahlberg  2019-11-03  651   * se=
rver. Must be called without holding tcon->open_file_lock,
32546a9586aa45 fs/cifs/file.c       Ronnie Sahlberg  2019-11-03  652   * ci=
node->open_file_lock and cifs_file->file_info_lock.
b98749cac4a695 fs/cifs/file.c       Aurelien Aptel   2019-03-29  653   *
b98749cac4a695 fs/cifs/file.c       Aurelien Aptel   2019-03-29  654   * If=
 @wait_for_oplock_handler is true and we are releasing the last
b98749cac4a695 fs/cifs/file.c       Aurelien Aptel   2019-03-29  655   * re=
ference, wait for any running oplock break handler of the file
607dfc79c37a0e fs/cifs/file.c       Steve French     2020-12-12  656   * an=
d cancel any pending one.
607dfc79c37a0e fs/cifs/file.c       Steve French     2020-12-12  657   *
607dfc79c37a0e fs/cifs/file.c       Steve French     2020-12-12  658   * @c=
ifs_file:    cifs/smb3 specific info (eg refcounts) for an open file
607dfc79c37a0e fs/cifs/file.c       Steve French     2020-12-12  659   * @w=
ait_oplock_handler: must be false if called from oplock_break_handler
607dfc79c37a0e fs/cifs/file.c       Steve French     2020-12-12  660   * @o=
ffload:      not offloaded on close and oplock breaks
b98749cac4a695 fs/cifs/file.c       Aurelien Aptel   2019-03-29  661   *
b98749cac4a695 fs/cifs/file.c       Aurelien Aptel   2019-03-29  662   */
32546a9586aa45 fs/cifs/file.c       Ronnie Sahlberg  2019-11-03  663  void =
_cifsFileInfo_put(struct cifsFileInfo *cifs_file,
32546a9586aa45 fs/cifs/file.c       Ronnie Sahlberg  2019-11-03  664       =
            bool wait_oplock_handler, bool offload)
b33879aa834ebe fs/cifs/file.c       Jeff Layton      2010-10-15  665  {
2b0143b5c986be fs/cifs/file.c       David Howells    2015-03-17  666    str=
uct inode *inode =3D d_inode(cifs_file->dentry);
96daf2b09178d8 fs/cifs/file.c       Steve French     2011-05-27  667    str=
uct cifs_tcon *tcon =3D tlink_tcon(cifs_file->tlink);
233839b1df65a2 fs/cifs/file.c       Pavel Shilovsky  2012-09-19  668    str=
uct TCP_Server_Info *server =3D tcon->ses->server;
e66673e39ac9d4 fs/cifs/file.c       Pavel Shilovsky  2010-11-02  669    str=
uct cifsInodeInfo *cifsi =3D CIFS_I(inode);
24261fc23db950 fs/cifs/file.c       Mateusz Guzik    2013-03-08  670    str=
uct super_block *sb =3D inode->i_sb;
24261fc23db950 fs/cifs/file.c       Mateusz Guzik    2013-03-08  671    str=
uct cifs_sb_info *cifs_sb =3D CIFS_SB(sb);
2bff0659338e58 fs/cifs/file.c       Steve French     2022-10-14  672    str=
uct cifs_fid fid =3D {};
233839b1df65a2 fs/cifs/file.c       Pavel Shilovsky  2012-09-19  673    str=
uct cifs_pending_open open;
ca7df8e0bb2a5e fs/cifs/file.c       Sachin Prabhu    2015-01-15  674    boo=
l oplock_break_cancelled;
a423dcbdabf457 fs/smb/client/file.c Ritvik Budhiraja 2024-04-02  675    boo=
l serverclose_offloaded =3D false;
cdff08e76612e5 fs/cifs/file.c       Steve French     2010-10-21  676
3afca265b5f53a fs/cifs/file.c       Steve French     2016-09-22  677    spi=
n_lock(&tcon->open_file_lock);
1a67c415965752 fs/cifs/file.c       Pavel Shilovsky  2019-10-23  678    spi=
n_lock(&cifsi->open_file_lock);
3afca265b5f53a fs/cifs/file.c       Steve French     2016-09-22  679    spi=
n_lock(&cifs_file->file_info_lock);
a423dcbdabf457 fs/smb/client/file.c Ritvik Budhiraja 2024-04-02  680
a423dcbdabf457 fs/smb/client/file.c Ritvik Budhiraja 2024-04-02  681    cif=
s_file->offload =3D offload;
5f6dbc9e4afe4d fs/cifs/file.c       Jeff Layton      2010-10-15  682    if =
(--cifs_file->count > 0) {
3afca265b5f53a fs/cifs/file.c       Steve French     2016-09-22  683       =
     spin_unlock(&cifs_file->file_info_lock);
1a67c415965752 fs/cifs/file.c       Pavel Shilovsky  2019-10-23  684       =
     spin_unlock(&cifsi->open_file_lock);
3afca265b5f53a fs/cifs/file.c       Steve French     2016-09-22  685       =
     spin_unlock(&tcon->open_file_lock);
cdff08e76612e5 fs/cifs/file.c       Steve French     2010-10-21  686       =
     return;
cdff08e76612e5 fs/cifs/file.c       Steve French     2010-10-21  687    }
3afca265b5f53a fs/cifs/file.c       Steve French     2016-09-22  688    spi=
n_unlock(&cifs_file->file_info_lock);
cdff08e76612e5 fs/cifs/file.c       Steve French     2010-10-21  689
233839b1df65a2 fs/cifs/file.c       Pavel Shilovsky  2012-09-19  690    if =
(server->ops->get_lease_key)
233839b1df65a2 fs/cifs/file.c       Pavel Shilovsky  2012-09-19  691       =
     server->ops->get_lease_key(inode, &fid);
233839b1df65a2 fs/cifs/file.c       Pavel Shilovsky  2012-09-19  692
233839b1df65a2 fs/cifs/file.c       Pavel Shilovsky  2012-09-19  693    /* =
store open in pending opens to make sure we don't miss lease break */
233839b1df65a2 fs/cifs/file.c       Pavel Shilovsky  2012-09-19  694    cif=
s_add_pending_open_locked(&fid, cifs_file->tlink, &open);
233839b1df65a2 fs/cifs/file.c       Pavel Shilovsky  2012-09-19  695
cdff08e76612e5 fs/cifs/file.c       Steve French     2010-10-21  696    /* =
remove it from the lists */
cdff08e76612e5 fs/cifs/file.c       Steve French     2010-10-21  697    lis=
t_del(&cifs_file->flist);
cdff08e76612e5 fs/cifs/file.c       Steve French     2010-10-21  698    lis=
t_del(&cifs_file->tlist);
fae8044c03c3c0 fs/cifs/file.c       Steve French     2018-10-19  699    ato=
mic_dec(&tcon->num_local_opens);
cdff08e76612e5 fs/cifs/file.c       Steve French     2010-10-21  700
cdff08e76612e5 fs/cifs/file.c       Steve French     2010-10-21  701    if =
(list_empty(&cifsi->openFileList)) {
f96637be081141 fs/cifs/file.c       Joe Perches      2013-05-04  702       =
     cifs_dbg(FYI, "closing last open instance for inode %p\n",
2b0143b5c986be fs/cifs/file.c       David Howells    2015-03-17  703       =
              d_inode(cifs_file->dentry));
253641388a4925 fs/cifs/file.c       Pavel Shilovsky  2012-09-18  704       =
     /*
253641388a4925 fs/cifs/file.c       Pavel Shilovsky  2012-09-18  705       =
      * In strict cache mode we need invalidate mapping on the last
253641388a4925 fs/cifs/file.c       Pavel Shilovsky  2012-09-18  706       =
      * close  because it may cause a error when we open this file
253641388a4925 fs/cifs/file.c       Pavel Shilovsky  2012-09-18  707       =
      * again and get at least level II oplock.
253641388a4925 fs/cifs/file.c       Pavel Shilovsky  2012-09-18  708       =
      */
4f8ba8a0c09593 fs/cifs/file.c       Pavel Shilovsky  2010-11-21  709       =
     if (cifs_sb->mnt_cifs_flags & CIFS_MOUNT_STRICT_IO)
aff8d5ca7a3dca fs/cifs/file.c       Jeff Layton      2014-04-30  710       =
             set_bit(CIFS_INO_INVALID_MAPPING, &cifsi->flags);
c67236281c5d74 fs/cifs/file.c       Pavel Shilovsky  2010-11-03  711       =
     cifs_set_oplock_level(cifsi, 0);
cdff08e76612e5 fs/cifs/file.c       Steve French     2010-10-21  712    }
3afca265b5f53a fs/cifs/file.c       Steve French     2016-09-22  713
1a67c415965752 fs/cifs/file.c       Pavel Shilovsky  2019-10-23  714    spi=
n_unlock(&cifsi->open_file_lock);
3afca265b5f53a fs/cifs/file.c       Steve French     2016-09-22  715    spi=
n_unlock(&tcon->open_file_lock);
cdff08e76612e5 fs/cifs/file.c       Steve French     2010-10-21  716
b98749cac4a695 fs/cifs/file.c       Aurelien Aptel   2019-03-29  717    opl=
ock_break_cancelled =3D wait_oplock_handler ?
b98749cac4a695 fs/cifs/file.c       Aurelien Aptel   2019-03-29  718       =
     cancel_work_sync(&cifs_file->oplock_break) : false;
ad635942c869ad fs/cifs/file.c       Jeff Layton      2011-07-26  719
cdff08e76612e5 fs/cifs/file.c       Steve French     2010-10-21  720    if =
(!tcon->need_reconnect && !cifs_file->invalidHandle) {
0ff78a221bf783 fs/cifs/file.c       Pavel Shilovsky  2012-09-18  721       =
     struct TCP_Server_Info *server =3D tcon->ses->server;
6d5786a34d98bf fs/cifs/file.c       Pavel Shilovsky  2012-06-20  722       =
     unsigned int xid;
a423dcbdabf457 fs/smb/client/file.c Ritvik Budhiraja 2024-04-02  723       =
     int rc;
0ff78a221bf783 fs/cifs/file.c       Pavel Shilovsky  2012-09-18  724
6d5786a34d98bf fs/cifs/file.c       Pavel Shilovsky  2012-06-20  725       =
     xid =3D get_xid();
43f8a6a74ee244 fs/cifs/file.c       Steve French     2019-12-02  726       =
     if (server->ops->close_getattr)
a423dcbdabf457 fs/smb/client/file.c Ritvik Budhiraja 2024-04-02  727       =
             rc =3D server->ops->close_getattr(xid, tcon, cifs_file);
43f8a6a74ee244 fs/cifs/file.c       Steve French     2019-12-02  728       =
     else if (server->ops->close)
a423dcbdabf457 fs/smb/client/file.c Ritvik Budhiraja 2024-04-02  729       =
             rc =3D server->ops->close(xid, tcon, &cifs_file->fid);
760ad0cac19835 fs/cifs/file.c       Pavel Shilovsky  2012-09-25  730       =
     _free_xid(xid);

Same

a423dcbdabf457 fs/smb/client/file.c Ritvik Budhiraja 2024-04-02  731
a423dcbdabf457 fs/smb/client/file.c Ritvik Budhiraja 2024-04-02 @732       =
     if (rc =3D=3D -EBUSY || rc =3D=3D -EAGAIN) {
a423dcbdabf457 fs/smb/client/file.c Ritvik Budhiraja 2024-04-02  733       =
             // Server close failed, hence offloading it as an async op
a423dcbdabf457 fs/smb/client/file.c Ritvik Budhiraja 2024-04-02  734       =
             queue_work(serverclose_wq, &cifs_file->serverclose);
a423dcbdabf457 fs/smb/client/file.c Ritvik Budhiraja 2024-04-02  735       =
             serverclose_offloaded =3D true;
a423dcbdabf457 fs/smb/client/file.c Ritvik Budhiraja 2024-04-02  736       =
     }
cdff08e76612e5 fs/cifs/file.c       Steve French     2010-10-21  737    }

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

