Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1111D101E0
	for <oe-kbuild@lists.linux.dev>; Tue, 28 Nov 2023 02:33:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aHEEFemc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701138822; x=1732674822;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=OMGTGiS/7cZfA8sauncbx2zTLqhsus9S+VcjjDx5Vzo=;
  b=aHEEFemc8FOVXFAb+sA4Fvv98oN6DshryoIX7cACahjzyVR3sCFIw+DC
   PXbB7Q8GvUGanIsO71M5fCrpUKJ0P11RT6PslxJS+JPyBucxd2z4Ce0Jb
   5hBaVQn3ERBdZv9WxoBpe+7jqkR1OiakJf25kfeGlE6wyMvAZZFphfM1Y
   4JNBjJ9Mir2zimhGi9jUn5NaxJikHEoFH6LHDtmkRS55u4zHqNw+6qti/
   Uy5t6WWymThcaI2PNyoX34fS96f2m+F58tktPNB/2Wv+s75ol/X+LhtQ3
   J4KwAKJdhuw8lhQLDBlbcURibx1iq7NevERthmR2uICYULCYDXH3pDpjA
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10907"; a="372209629"
X-IronPort-AV: E=Sophos;i="6.04,232,1695711600"; 
   d="scan'208";a="372209629"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2023 18:33:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10907"; a="891935682"
X-IronPort-AV: E=Sophos;i="6.04,232,1695711600"; 
   d="scan'208";a="891935682"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
  by orsmga004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 27 Nov 2023 18:33:40 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Mon, 27 Nov 2023 18:33:40 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Mon, 27 Nov 2023 18:33:39 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Mon, 27 Nov 2023 18:33:39 -0800
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.40) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Mon, 27 Nov 2023 18:33:39 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=epW6DBdCi8rUpry0xQSgJdzJSxX5CqcjGHu94116pPmV4F7z9ZsuTqWQtbaFX0OBncZTcq9eh9yc6H2ojDdekDe2Hto582wSaccbgTqZyWVElYQ5z0yb8oukKO1HM4sSm5SPQsHh4pRgKlgaSEL0yuRMGi904AdQ1x3b2+YZ9IemwFzQw30X9Y0gKkwox6k6JNF/30mQDYvcpXnnsHUaLgTQ5Lb57bEIrx7yRA8cyUXthOtUChGmn7+htV+iWVCS0t+xIrh4KZ0qxnTa+D4WvhzZB7ntVLE31p9Ii+fB5YH0CejyeuFQRN2O2RL8e076XDPz/2oRR/2Gs15pJTchGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XjAEaSCpeypIDGiZl2AjhSSLc+P1p3wmKBl4PHQUGSo=;
 b=XfoRY07wxKruCEH4NgHRjAAp3dfzQsjbQmUlSdp2In3euIU/qXbxzQWd6EG2AHrBHG3z4mhyNd28CiDODN9HIeXA8p/8dIADGmP8CPxMcXrt9d5JkmWTtnaReBgA2M/ZITWflQgg7QNJy+GRzwwqkz/yOVwBwYiF9PgQtF+UGcpuPuIVST9JP2D15agZ7CPBlOM+Raw2berAcAF62bzZ71ymQ1DsI1XLqM/ao2MGkL0JWnXu+RlRSCwBt9rJSHxGycWxxQvIPeiqH55L1sOGLBHR29ostps7oUzgGXD3u1ZlOD/62OYGRkpmq8zysTXzEPMG+7Bzov0YhClDnQTyMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6392.namprd11.prod.outlook.com (2603:10b6:930:37::15)
 by SJ0PR11MB5022.namprd11.prod.outlook.com (2603:10b6:a03:2d7::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.29; Tue, 28 Nov
 2023 02:33:37 +0000
Received: from CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::15d3:7425:a09e:1c86]) by CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::15d3:7425:a09e:1c86%4]) with mapi id 15.20.7025.022; Tue, 28 Nov 2023
 02:33:37 +0000
From: "Liu, Yujie" <yujie.liu@intel.com>
To: lkp <lkp@intel.com>, "oe-kbuild@lists.linux.dev"
	<oe-kbuild@lists.linux.dev>
Subject: RE: [ti:ti-rt-linux-6.1.y-cicd 31/69] dtbs_check:
 Documentation/devicetree/bindings/net/ti,icssg-prueth.yaml:
 ti,half-duplex-capable: missing type definition
Thread-Topic: [ti:ti-rt-linux-6.1.y-cicd 31/69] dtbs_check:
 Documentation/devicetree/bindings/net/ti,icssg-prueth.yaml:
 ti,half-duplex-capable: missing type definition
Thread-Index: AQHaIKWhQnnRw0heQ06SAKOPlxbrrrCPBPlw
Date: Tue, 28 Nov 2023 02:33:37 +0000
Message-ID: <CY5PR11MB639297C9226FA51FFFB0F134FBBCA@CY5PR11MB6392.namprd11.prod.outlook.com>
References: <202311270213.YgvyuUG5-lkp@intel.com>
In-Reply-To: <202311270213.YgvyuUG5-lkp@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR11MB6392:EE_|SJ0PR11MB5022:EE_
x-ms-office365-filtering-correlation-id: 35a68478-9c22-4d0f-ebe8-08dbefba6ced
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: RKjnP6PnMngTVshFk1J84jQDbFvmnMA1E4+/2/CVChXlNbKELHsZTCXf7DEAGn+XLknLPyYB3VX5j9t4YDqIF4tCKLeoW1I3dyJkQPIWwGif0gcK68P4asf8u2sIkXSLL7APe1r3+H700Sf+fJ+yIaWQw9MGsuY3y58QI8pWzSDJ7gnyAIjbkrYc6gbC9ai0wVni/KUtzC0onG952WP4iDOfgOtpDaumPh8JAYSucNrUOOTr7nSQxraqcZp+cdeF1NEBLfFAshgaE6ulHVZaDoueXnMXlKnudZwk9eJrxUOmeHaJrPtrMNsMf36h7xLrY60qr4gLKXRDZRoHFsBmXOaBfSeOFyatSBIk6ja0OX8WTKbDb9LlVjQhuQK5f5wn50eoEZgV3Mq0rYLdqxN3yMcRkiL+7O51/nt8DS2WyZTEGCRzdcSrvsJnL/QIJM5dWVlrS4I7USEcnbudyJrr90J25UyjAQysmEbdkRlojYyb6oc+VkssMB34Axnk7R6JGc7CmYO16dbDGYWPCQtmE5oO2bgTw0QtNHt6kDdvfPMsQ+N8hYsmQ6bP5S44NqOZgOSPZkfp9hchD6vbt8bg9IgP+m6196NxSDQPdWp6hFMbPfoprMYEGbjrobrgzs9yx2CzuNN1tspl1rt/C35kwJsSEYp55QtA2YlPcOKeAalAlGgqxRfV3PdjFd3PMG+f
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR11MB6392.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(136003)(366004)(39860400002)(346002)(396003)(230173577357003)(230273577357003)(230922051799003)(64100799003)(186009)(1800799012)(451199024)(316002)(53546011)(6506007)(9686003)(7696005)(71200400001)(86362001)(26005)(110136005)(33656002)(76116006)(966005)(478600001)(82960400001)(83380400001)(38100700002)(122000001)(66476007)(66946007)(66556008)(38070700009)(66446008)(64756008)(5660300002)(2906002)(55016003)(41300700001)(8936002)(8676002)(52536014);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?QkZsMhQaL8aaKKRvqOCAYTarYoe0pYjgNCE3IRk8wTHMWUbdsK2olUy5V/K9?=
 =?us-ascii?Q?5zjHBw3rnvlyBYq/+XPlvWopbMMXbvg6Q/DMiEEcv8iRRdF5x6BMUlBDNC4U?=
 =?us-ascii?Q?vTK3T5P2TjM1JzF3TGn4BZGURAaCOx4SXwbw2+6dm35Ii4Q+wQNDIZvTZLCv?=
 =?us-ascii?Q?mfwanpDTdV/dX2TkHDXUNmkxGwAAr6dJ5+bwGyQli6Lu2JyV975cEC7cQYOy?=
 =?us-ascii?Q?Fb2b8c/J6OcO5MKN5636/1OyuR8TMW8EwA6q1wRdqiaZwnSEnYC2UsXuHTXY?=
 =?us-ascii?Q?xfFIH+8IDG7YLQNj2GzsR/bN/1EJNXAyWChga8Uhj2erNkKb06FX+Vn6xF0+?=
 =?us-ascii?Q?EVpeoK6xV5CSYpgZy+lHJXyZ5vYpjsSgoYvazNtumxRq3+YKNVq9kscqCP0B?=
 =?us-ascii?Q?qKC3YCuDwvINnFv2Lg9jDYgsOl0VPPXlaSY3NIoyYstJ1hhyB9892fdgTfvq?=
 =?us-ascii?Q?nursJ41rlqafIy5YXFrzRRnTkUqzDSJ0KYNLVFC0R7sfCSugrfcDYjACHV2Y?=
 =?us-ascii?Q?qY91k1Tg0vEMDedsR2/X7fqqy7NWmuKfkcE2/kGF8qJiItVWoUpiBP0gxNkY?=
 =?us-ascii?Q?ioS46p73F6w/L+WTAqgqmkU0Ian5c41O++IExbwa0B/RnPJT0LR24NFMtdIn?=
 =?us-ascii?Q?z+vjVua4oGNhx9PGbmF2QNuD2HDRO7wgFfrsEouWlMbLYu70E8u4DMo09JsO?=
 =?us-ascii?Q?DwbNuXOf+r+euRJPjBnTU+7crrPvWbi9ZN7g/DMjSq/epbY742g8htihcpMN?=
 =?us-ascii?Q?5LvD/LHj2glFXwweo/QzRHvNk485aywlvhkpx9LF141eyf54LmSqYCVs/K+x?=
 =?us-ascii?Q?LX/cIejZQXOlRi+4aCrhOYXiCueu4Em/t1z9ksRKMgtxSHQpBCNuwMP7jLPZ?=
 =?us-ascii?Q?8dS3gau+r2tJQWqdnjjWtGtA5FShUhPF3XqmLlcJxAEtY33GkLSRj3/UJXIn?=
 =?us-ascii?Q?heaKEBQuy/zwmx1NIivB2qio+8h/t11sIGV17SKW57kwOAOubW4hHP8s6wdM?=
 =?us-ascii?Q?tCSX2k310v+sfuKvNRcG8DF6wwxdg3VhY8rRo49VeWDYf9aCmkt9I2Yzy1SA?=
 =?us-ascii?Q?l2oZZfMWMYJQNIsTLr4piuwhGE6s4OAiAh66l5LE5mMwG+yeIgi7iHQ6QrLN?=
 =?us-ascii?Q?pFLHWRP+9iMV3oT2e2KIKmWpRm0uNIbtF5ObeLv8pnPJLyBFe8WGYaRlzmd0?=
 =?us-ascii?Q?Ghwqvvx6LHCrJeSNvMiSrDwzu2zb1rrOu/k5wDYDChDmK5I2UPouoaKz76mL?=
 =?us-ascii?Q?LRrHcS+ieB7+tnAOUxNcH31crHq4TwPXFUwXMIAUilHc/LpgTvtQzYrcY/LV?=
 =?us-ascii?Q?Mh0lHM+C6Xmz+BVxPDc4ulnX73trhxWJ5zAl0Jy/2cf5iyd8SaGVs1D9F9RQ?=
 =?us-ascii?Q?ey31gcLCrsPvbs6COYT2iTtBOOYwsfq0H4bpckGBFa44ggVmHi6OMVmW3ZNt?=
 =?us-ascii?Q?D1mOCn5vj6Y7Bkv3KjCfzaektLnIGV8rRcQH89csaoOKiToTQ6cCZxETJlY2?=
 =?us-ascii?Q?5DCYt/qR7xzd3lrJZVatkmrscEzmfLSsTxrJa7xaJ5ZSBBDs7PRRwi7gKMkv?=
 =?us-ascii?Q?ZTNf/pc8HA7uVrukZyDDR3AKfsHqtYaG+EeD2EXp?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 35a68478-9c22-4d0f-ebe8-08dbefba6ced
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Nov 2023 02:33:37.2986
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: k7lSvXh9wv0qL3H8TfFe3AiaOCMGGafX+u/MmM3WLRSiJIJhL6N7x2uYyaD/bq08sLgvxo3Lg+Z5nhpcpCWIsQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5022
X-OriginatorOrg: intel.com

not_report

already fixed in upstream.

commit 927c568d62128f48d6646d6df801c1ae25cf139f
Author: MD Danish Anwar <danishanwar@ti.com>
Date:   Wed Sep 13 14:40:10 2023 +0530

    dt-bindings: net: Add documentation for Half duplex support.

    In order to support half-duplex operation at 10M and 100M link speeds, =
the
    PHY collision detection signal (COL) should be routed to ICSSG
    GPIO pin (PRGx_PRU0/1_GPI10) so that firmware can detect collision sign=
al
    and apply the CSMA/CD algorithm applicable for half duplex operation. A=
 DT
    property, "ti,half-duplex-capable" is introduced for this purpose. If
    board has PHY COL pin conencted to PRGx_PRU1_GPIO10, this DT property c=
an
    be added to eth node of ICSSG, MII port to support half duplex operatio=
n at
    that port.

    Reviewed-by: Roger Quadros <rogerq@kernel.org>
    Signed-off-by: MD Danish Anwar <danishanwar@ti.com>
    Reviewed-by: Andrew Lunn <andrew@lunn.ch>
    Acked-by: Conor Dooley <conor.dooley@microchip.com>
    Reviewed-by: Rob Herring <robh@kernel.org>
    Signed-off-by: David S. Miller <davem@davemloft.net>

diff --git a/Documentation/devicetree/bindings/net/ti,icssg-prueth.yaml b/D=
ocumentation/devicetree/bindings/net/ti,icssg-prueth.yaml
index 836d2d60e87d1..229c8f32019fb 100644
--- a/Documentation/devicetree/bindings/net/ti,icssg-prueth.yaml
+++ b/Documentation/devicetree/bindings/net/ti,icssg-prueth.yaml
@@ -107,6 +107,13 @@ properties:
               phandle to system controller node and register offset
               to ICSSG control register for RGMII transmit delay

+          ti,half-duplex-capable:
+            type: boolean
+            description:
+              Indicates that the PHY output pin COL is routed to ICSSG GPI=
O pin
+              (PRGx_PRU0/1_GPIO10) as input so that the ICSSG MII port is
+              capable of half duplex operations.
+
         required:
           - reg
     anyOf:

-----Original Message-----
From: lkp <lkp@intel.com>=20
Sent: Monday, November 27, 2023 04:15
To: oe-kbuild@lists.linux.dev
Cc: lkp <lkp@intel.com>
Subject: [ti:ti-rt-linux-6.1.y-cicd 31/69] dtbs_check: Documentation/device=
tree/bindings/net/ti,icssg-prueth.yaml: ti,half-duplex-capable: missing typ=
e definition

::::::=20
:::::: Manual check reason: "low confidence static check warning: Documenta=
tion/devicetree/bindings/net/ti,icssg-prueth.yaml: ti,half-duplex-capable: =
missing type definition"
::::::=20

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: vigneshr@ti.com
CC: nm@ti.com
TO: MD Danish Anwar <danishanwar@ti.com>
CC: Vignesh Raghavendra <vigneshr@ti.com>

tree:   git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git ti-rt-linux-6.=
1.y-cicd
head:   3a4f51391fe1d39254fed39393815b2879e44d73
commit: 656ff87b30c4741c64a47402417c22e77dc3f736 [31/69] dt-bindings: net: =
ti: icssg-prueth: Add documentation for Half duplex support.
:::::: branch date: 2 days ago
:::::: commit date: 6 months ago
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231127/202311270213.Y=
gvyuUG5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202311270213.YgvyuUG5-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   /usr/local/lib/python3.11/dist-packages/dtschema/schemas/reserved-memory=
/memory-region.yaml: warning: ignoring duplicate '$id' value 'http://device=
tree.org/schemas/reserved-memory/memory-region.yaml#'
   /usr/local/lib/python3.11/dist-packages/dtschema/schemas/reserved-memory=
/reserved-memory.yaml: warning: ignoring duplicate '$id' value 'http://devi=
cetree.org/schemas/reserved-memory/reserved-memory.yaml#'
   /usr/local/lib/python3.11/dist-packages/dtschema/schemas/reserved-memory=
/shared-dma-pool.yaml: warning: ignoring duplicate '$id' value 'http://devi=
cetree.org/schemas/reserved-memory/shared-dma-pool.yaml#'
   Documentation/devicetree/bindings/regulator/pwm-regulator.yaml: pwm-duty=
cycle-unit: missing type definition
   Documentation/devicetree/bindings/input/mediatek,pmic-keys.yaml: linux-k=
eycodes: missing type definition
   Documentation/devicetree/bindings/media/i2c/ti,ds90ub960.yaml: i2c-alias=
: missing type definition
   Documentation/devicetree/bindings/media/renesas,vin.yaml: field-active-e=
ven: missing type definition
   Documentation/devicetree/bindings/mtd/ingenic,nand.yaml: ecc-engine: mis=
sing type definition
   Documentation/devicetree/bindings/i2c/opencores,i2c-ocores.yaml: regstep=
: missing type definition
>> Documentation/devicetree/bindings/net/ti,icssg-prueth.yaml: ti,half-dupl=
ex-capable: missing type definition
   Documentation/devicetree/bindings/auxdisplay/holtek,ht16k33.yaml: linux,=
no-autorepeat: missing type definition
   Documentation/devicetree/bindings/mmc/sdhci-am654.yaml: sdhci-caps-mask:=
 missing type definition
   Documentation/devicetree/bindings/sound/audio-graph.yaml: convert-sample=
-format: missing type definition
   Documentation/devicetree/bindings/sound/qcom,wcd934x.yaml: slim-ifc-dev:=
 missing type definition
   Documentation/devicetree/bindings/serial/8250_omap.yaml: rs485-rts-activ=
e-high: missing type definition
   Documentation/devicetree/bindings/display/panel/advantech,idk-2121wr.yam=
l: dual-lvds-odd-pixels: missing type definition
   Documentation/devicetree/bindings/display/panel/advantech,idk-2121wr.yam=
l: dual-lvds-even-pixels: missing type definition
   Documentation/devicetree/bindings/display/bridge/nxp,tda998x.yaml: video=
-ports: missing type definition

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

