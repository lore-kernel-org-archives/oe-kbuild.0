Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34F051A59C
	for <oe-kbuild@lists.linux.dev>; Wed,  3 Jan 2024 14:29:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Gjat/Buv"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-1d3fde109f2so107865ad.1
        for <oe-kbuild@lists.linux.dev>; Wed, 03 Jan 2024 06:29:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1704292193; x=1704896993; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oVEKfZs2DLLoJBucrUU9KPu7VS008ehBPwm9FkA9RgE=;
        b=Gjat/Buv1PzGCkKmEDaXHUpua5C84ZgUOXFhWQq462eAppMz1Wy08zXxLTIKybKlOY
         GAiF3tx0ezRV1JFsagmEokVB7vksfmVAkjQONZt1UOR4RzczkP+ZNTGlR9pelIdfk2qj
         SakkghG/xkXIfRdCVYqwHij+0iHWtDRIV9vlUCmxGEhL9WwYUCTtvJCFD25RJZXEWZjR
         F8V6gWf/lU4OlZiLSU6JuTtEBwVY9yzpIuGRrY7Mv6ZSix4iRxYY0OWq7V6/vHCEK6Vd
         uLK8kxP/gxwtTMcRxb8IcF8vWdCNfy8FriwA8xId4bcQ+/pxPVLDu5pCGcJ0O/cnUlin
         17Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704292193; x=1704896993;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oVEKfZs2DLLoJBucrUU9KPu7VS008ehBPwm9FkA9RgE=;
        b=hmEFiGg4WgAA+G1Qp0Iu9jkT8JU+BAFaFgTk7mRuA7uTeDahrxQ8G5AuHYyKDoqy8u
         6qYMSro1OOaje54NizcVl5CE4q0czsmeDCmTN8OSKNj1hBW+wP6abBFTPE7ruuXSWrng
         ajdfPqzL133Y3PfSBYz7iyZw6mG8YcepJUcAwdG/no/z63UIYghZ+XVbqvWE7pHboDIG
         IFcf4nBe+AsskM9LLNOeOnxglY0wmeclzrKtOECP/h13aDbmKSPp2e7T0o+J2355vdfH
         0wqwLGM7h/AWokSvBYTZ98o3Kl6oJhDzlGpVnCZ4o8SHiuPeG/GVv9w4qGGLtxak9ccE
         NAdQ==
X-Gm-Message-State: AOJu0YxiDeuvlH+TYNDFZ7mC85sO5S6QKQMLN3l+EwCDDrUZQq/k5+DB
	GPFYbaM4SQEoyszS28zqby8SwUsUe1UE8GyYSxApfoe81kY6
X-Google-Smtp-Source: AGHT+IFF7WKOxIOZEaJ5Kz2sTuauklxf37gjIrk4WsTMuHIqjeoPENHgJr+UbkTrFrWygnbUbTj4/IiqxjI2vP7vKhU=
X-Received: by 2002:a17:903:94e:b0:1d4:3cf7:ef28 with SMTP id
 ma14-20020a170903094e00b001d43cf7ef28mr135098plb.9.1704292193249; Wed, 03 Jan
 2024 06:29:53 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <0000000000009ae37b060d32c643@google.com> <5e68be46-caab-40f4-8e0f-543566fd7c28@moroto.mountain>
In-Reply-To: <5e68be46-caab-40f4-8e0f-543566fd7c28@moroto.mountain>
From: Aleksandr Nogikh <nogikh@google.com>
Date: Wed, 3 Jan 2024 15:29:41 +0100
Message-ID: <CANp29Y64Pzp_SstZsM5n4x5RwJxYbnBP3asUxOvvAkJ4_mo_Sw@mail.gmail.com>
Subject: Re: [PATCH] usbhid: fix array-index-out-of-bounds in usbhid_parse
 UBSAN warning
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: oe-kbuild@lists.linux.dev, 
	syzbot <syzbot+c52569baf0c843f35495@syzkaller.appspotmail.com>, 
	linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com, lkp@intel.com, 
	oe-kbuild-all@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Dan,

In this particular case syzbot just forwarded a user's patch testing
request to the LKML. I think there's not much value in kernel test
robot analyzing such emails.

--=20
Aleksandr

On Wed, Jan 3, 2024 at 3:12=E2=80=AFPM Dan Carpenter <dan.carpenter@linaro.=
org> wrote:
>
> Hi syzbot,
>
> kernel test robot noticed the following build warnings:
>
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/syzbot/usbhid-fix-=
array-index-out-of-bounds-in-usbhid_parse-UBSAN-warning/20231225-153341
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/hid/hid.git for-n=
ext
> patch link:    https://lore.kernel.org/r/0000000000009ae37b060d32c643%40g=
oogle.com
> patch subject: [PATCH] usbhid: fix array-index-out-of-bounds in usbhid_pa=
rse UBSAN warning
> config: x86_64-randconfig-161-20231225 (https://download.01.org/0day-ci/a=
rchive/20231226/202312260900.gRDPofL9-lkp@intel.com/config)
> compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git =
ae42196bc493ffe877a7e3dff8be32035dea4d07)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> | Closes: https://lore.kernel.org/r/202312260900.gRDPofL9-lkp@intel.com/
>
> smatch warnings:
> drivers/hid/usbhid/hid-core.c:1026 usbhid_parse() warn: curly braces inte=
nded?
> drivers/hid/usbhid/hid-core.c:1029 usbhid_parse() warn: inconsistent inde=
nting
>
> vim +1026 drivers/hid/usbhid/hid-core.c
>
> c500c9714011ed drivers/hid/usbhid/hid-core.c Jiri Slaby         2008-05-1=
6   979  static int usbhid_parse(struct hid_device *hid)
> c500c9714011ed drivers/hid/usbhid/hid-core.c Jiri Slaby         2008-05-1=
6   980  {
> c500c9714011ed drivers/hid/usbhid/hid-core.c Jiri Slaby         2008-05-1=
6   981        struct usb_interface *intf =3D to_usb_interface(hid->dev.par=
ent);
> ^1da177e4c3f41 drivers/usb/input/hid-core.c  Linus Torvalds     2005-04-1=
6   982        struct usb_host_interface *interface =3D intf->cur_altsettin=
g;
> ^1da177e4c3f41 drivers/usb/input/hid-core.c  Linus Torvalds     2005-04-1=
6   983        struct usb_device *dev =3D interface_to_usbdev (intf);
> ^1da177e4c3f41 drivers/usb/input/hid-core.c  Linus Torvalds     2005-04-1=
6   984        struct hid_descriptor *hdesc;
> 2eb5dc30eb87aa drivers/hid/usbhid/hid-core.c Paul Walmsley      2007-04-1=
9   985        u32 quirks =3D 0;
> c500c9714011ed drivers/hid/usbhid/hid-core.c Jiri Slaby         2008-05-1=
6   986        unsigned int rsize =3D 0;
> c5b7c7c395a34f drivers/usb/input/hid-core.c  Dmitry Torokhov    2005-09-1=
5   987        char *rdesc;
> c500c9714011ed drivers/hid/usbhid/hid-core.c Jiri Slaby         2008-05-1=
6   988        int ret, n;
> f043bfc98c193c drivers/hid/usbhid/hid-core.c Jaejoong Kim       2017-09-2=
8   989        int num_descriptors;
> f043bfc98c193c drivers/hid/usbhid/hid-core.c Jaejoong Kim       2017-09-2=
8   990        size_t offset =3D offsetof(struct hid_descriptor, desc);
> ^1da177e4c3f41 drivers/usb/input/hid-core.c  Linus Torvalds     2005-04-1=
6   991
> d5d3e202753cc0 drivers/hid/usbhid/hid-core.c Benjamin Tissoires 2017-11-2=
0   992        quirks =3D hid_lookup_quirk(hid);
> ^1da177e4c3f41 drivers/usb/input/hid-core.c  Linus Torvalds     2005-04-1=
6   993
> 6f4303fb2ec680 drivers/hid/usbhid/hid-core.c Jiri Kosina        2009-01-2=
9   994        if (quirks & HID_QUIRK_IGNORE)
> 6f4303fb2ec680 drivers/hid/usbhid/hid-core.c Jiri Kosina        2009-01-2=
9   995                return -ENODEV;
> 6f4303fb2ec680 drivers/hid/usbhid/hid-core.c Jiri Kosina        2009-01-2=
9   996
> 0f28b55db54300 drivers/usb/input/hid-core.c  Alan Stern         2006-05-1=
5   997        /* Many keyboards and mice don't like to be polled for repor=
ts,
> 0f28b55db54300 drivers/usb/input/hid-core.c  Alan Stern         2006-05-1=
5   998         * so we will always set the HID_QUIRK_NOGET flag for them. =
*/
> 0f28b55db54300 drivers/usb/input/hid-core.c  Alan Stern         2006-05-1=
5   999        if (interface->desc.bInterfaceSubClass =3D=3D USB_INTERFACE_=
SUBCLASS_BOOT) {
> 0f28b55db54300 drivers/usb/input/hid-core.c  Alan Stern         2006-05-1=
5  1000                if (interface->desc.bInterfaceProtocol =3D=3D USB_IN=
TERFACE_PROTOCOL_KEYBOARD ||
> 0f28b55db54300 drivers/usb/input/hid-core.c  Alan Stern         2006-05-1=
5  1001                        interface->desc.bInterfaceProtocol =3D=3D US=
B_INTERFACE_PROTOCOL_MOUSE)
> 0f28b55db54300 drivers/usb/input/hid-core.c  Alan Stern         2006-05-1=
5  1002                                quirks |=3D HID_QUIRK_NOGET;
> 0f28b55db54300 drivers/usb/input/hid-core.c  Alan Stern         2006-05-1=
5  1003        }
> 0f28b55db54300 drivers/usb/input/hid-core.c  Alan Stern         2006-05-1=
5  1004
> c5b7c7c395a34f drivers/usb/input/hid-core.c  Dmitry Torokhov    2005-09-1=
5  1005        if (usb_get_extra_descriptor(interface, HID_DT_HID, &hdesc) =
&&
> c5b7c7c395a34f drivers/usb/input/hid-core.c  Dmitry Torokhov    2005-09-1=
5  1006            (!interface->desc.bNumEndpoints ||
> ^1da177e4c3f41 drivers/usb/input/hid-core.c  Linus Torvalds     2005-04-1=
6  1007             usb_get_extra_descriptor(&interface->endpoint[0], HID_D=
T_HID, &hdesc))) {
> 58037eb961f859 drivers/hid/usbhid/hid-core.c Jiri Kosina        2007-05-3=
0  1008                dbg_hid("class descriptor not present\n");
> c500c9714011ed drivers/hid/usbhid/hid-core.c Jiri Slaby         2008-05-1=
6  1009                return -ENODEV;
> ^1da177e4c3f41 drivers/usb/input/hid-core.c  Linus Torvalds     2005-04-1=
6  1010        }
> ^1da177e4c3f41 drivers/usb/input/hid-core.c  Linus Torvalds     2005-04-1=
6  1011
> f043bfc98c193c drivers/hid/usbhid/hid-core.c Jaejoong Kim       2017-09-2=
8  1012        if (hdesc->bLength < sizeof(struct hid_descriptor)) {
> f043bfc98c193c drivers/hid/usbhid/hid-core.c Jaejoong Kim       2017-09-2=
8  1013                dbg_hid("hid descriptor is too short\n");
> f043bfc98c193c drivers/hid/usbhid/hid-core.c Jaejoong Kim       2017-09-2=
8  1014                return -EINVAL;
> f043bfc98c193c drivers/hid/usbhid/hid-core.c Jaejoong Kim       2017-09-2=
8  1015        }
> f043bfc98c193c drivers/hid/usbhid/hid-core.c Jaejoong Kim       2017-09-2=
8  1016
> c500c9714011ed drivers/hid/usbhid/hid-core.c Jiri Slaby         2008-05-1=
6  1017        hid->version =3D le16_to_cpu(hdesc->bcdHID);
> c500c9714011ed drivers/hid/usbhid/hid-core.c Jiri Slaby         2008-05-1=
6  1018        hid->country =3D hdesc->bCountryCode;
> c500c9714011ed drivers/hid/usbhid/hid-core.c Jiri Slaby         2008-05-1=
6  1019
> f043bfc98c193c drivers/hid/usbhid/hid-core.c Jaejoong Kim       2017-09-2=
8  1020        num_descriptors =3D min_t(int, hdesc->bNumDescriptors,
> f043bfc98c193c drivers/hid/usbhid/hid-core.c Jaejoong Kim       2017-09-2=
8  1021               (hdesc->bLength - offset) / sizeof(struct hid_class_d=
escriptor));
> f043bfc98c193c drivers/hid/usbhid/hid-core.c Jaejoong Kim       2017-09-2=
8  1022
> f043bfc98c193c drivers/hid/usbhid/hid-core.c Jaejoong Kim       2017-09-2=
8  1023        for (n =3D 0; n < num_descriptors; n++)
>
> This for loop needs curly braces now.
>
> d3e0d5b253c73b drivers/hid/usbhid/hid-core.c syzbot             2023-12-2=
3  1024                if (n >=3D ARRAY_SIZE(hdesc->desc))
> d3e0d5b253c73b drivers/hid/usbhid/hid-core.c syzbot             2023-12-2=
3  1025                        break;
> ^1da177e4c3f41 drivers/usb/input/hid-core.c  Linus Torvalds     2005-04-1=
6 @1026                if (hdesc->desc[n].bDescriptorType =3D=3D HID_DT_REP=
ORT)
> ^1da177e4c3f41 drivers/usb/input/hid-core.c  Linus Torvalds     2005-04-1=
6  1027                        rsize =3D le16_to_cpu(hdesc->desc[n].wDescri=
ptorLength);
> ^1da177e4c3f41 drivers/usb/input/hid-core.c  Linus Torvalds     2005-04-1=
6  1028
> ^1da177e4c3f41 drivers/usb/input/hid-core.c  Linus Torvalds     2005-04-1=
6 @1029        if (!rsize || rsize > HID_MAX_DESCRIPTOR_SIZE) {
> 58037eb961f859 drivers/hid/usbhid/hid-core.c Jiri Kosina        2007-05-3=
0  1030                dbg_hid("weird size of report descriptor (%u)\n", rs=
ize);
> c500c9714011ed drivers/hid/usbhid/hid-core.c Jiri Slaby         2008-05-1=
6  1031                return -EINVAL;
> ^1da177e4c3f41 drivers/usb/input/hid-core.c  Linus Torvalds     2005-04-1=
6  1032        }
> ^1da177e4c3f41 drivers/usb/input/hid-core.c  Linus Torvalds     2005-04-1=
6  1033
> 52150c78270db5 drivers/hid/usbhid/hid-core.c Joe Perches        2017-03-0=
1  1034        rdesc =3D kmalloc(rsize, GFP_KERNEL);
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
>
> --
> You received this message because you are subscribed to the Google Groups=
 "syzkaller-bugs" group.
> To unsubscribe from this group and stop receiving emails from it, send an=
 email to syzkaller-bugs+unsubscribe@googlegroups.com.
> To view this discussion on the web visit https://groups.google.com/d/msgi=
d/syzkaller-bugs/5e68be46-caab-40f4-8e0f-543566fd7c28%40moroto.mountain.
