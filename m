Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D115C1E481;
	Sat, 17 Aug 2024 14:24:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723904676; cv=none; b=rFNoFAP4BQY5gCpXhrd2To6Yblohcff0qaa2i7l5ffop2W0SDXMB/14NXLvhLDd2eSTSl8CjYgTmHf8qjTCZ0VOzmcgrrSP3Ec8MJOhAScQJtbELTlZQpPiZHkMpxXuY+hSvKsianXcRbNHporWCl9nypFtxtCsFyBoZTFkcr9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723904676; c=relaxed/simple;
	bh=V36+5U+Rf6AlMUR5aRKGPesWGPSbPaMZ5KL23zwiIKE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CpMYuOqv14SGiRpgQ/wfG4aJEn0Lazk7EIxyPuUtg2tFgcCKuswFSBLIK/7BM/p4zYJOTWOR8rSmiviHwjqkuRNA/UId8EIw/bEixlUYNdEBym02P7Z+mQHlA/wAAqAJ1qOqdvTYl8VdI62BpfMEXix2vOjPDQPQdOOnNyvuEIk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UOkKzbML; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UOkKzbML"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-367990aaef3so1673960f8f.0;
        Sat, 17 Aug 2024 07:24:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723904673; x=1724509473; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N2ylZGda1UbKFev/Hg4IvXMUgiJFczD/6TSHLJ0QRZU=;
        b=UOkKzbML5EUmGSmAio1dBdpd7u+bTHYstLAeVQ/SqQqdEk8NBQv1L+MmifmKWSmTwS
         16C0JVjjKZv5us9rUG7TN9UeFjfj3bJGNmG6H/8KyE3r0APFOyU/426+zbn1sAM9mXbU
         xXxF1bEfw7eXW5iMTmGfWTatGuW8/LwKDy3izVG3+b/Tb72jCpsfh5lBASLhg5bnQ5mp
         F2VFVIzwjiWjOPd34LVs4R9QWGQiSzZ2k+zknS8JIH6zordgA+9G59g61TrR4mQA9+Ry
         vKPzsIgQroXQAgWEfYJ2GfvJTzdzsptym1ZO5Bd04cft515PoNfVTifM3LKUvQ6C9kIP
         okOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723904673; x=1724509473;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=N2ylZGda1UbKFev/Hg4IvXMUgiJFczD/6TSHLJ0QRZU=;
        b=MnHLy0iEmIJMOcEYOJ4GJ4wO6ldLznvzoIx3/88goHctkp9EH5oa/8bMNzo/wD+rsZ
         ict4x7tOKjW4JjZ2usKMkJaz71vSa16DaniM6K2aR1hlNi1d0mEDREfsD59+ilDPdSbV
         jfIy2qoxtWC0A+n24UyKX8+zMEYa7hVy8YjtcUVkbpL2ApzoAeMhcy055jep+abai4P1
         vwxbbaSBSb/Ej+J810ns1STcVirmZBr+i7jqjxwtY5OIewseEkJ0kRaYpfrAkNXzMJv9
         D4O1S1mY8YSoM8dLaURl9G+on0jYlyGp/GtUtVIYd+0BcfJLleulr7cgFxx9IQDKW3YM
         eavg==
X-Forwarded-Encrypted: i=1; AJvYcCXsj3TnLJbvEHg6EdvtiYXf/8C6US6uzZ0hkDfE+1FvDX4RIGPPcmlADEXQhKF6m5nINM8UUznVv6RO76Z2m1RYFmiGv6mREutvyp2hFQ==
X-Gm-Message-State: AOJu0Yx17bl19Ik/92MScHXL2E6gVMaY7BdCzXi/FsTdKg0vK491LPdy
	uBqzBBZ7QmzVE4VHs8jZLD65t8mCHpzqYSllrBx4eu2hK5JpL255ym2uu2kILR9OW2oY/1rsP4q
	uikO9Ii3/MXlqJ/kWDHt7vMgYW48=
X-Google-Smtp-Source: AGHT+IF7RwnVwpW0z165xK7DTXOlfNsz1aeKMZU3huOOoqNGMVoAt+/OBTyKpWWj89IGnwJkhUhihXY3NCtj49gxpvA=
X-Received: by 2002:adf:e907:0:b0:371:8ae3:2941 with SMTP id
 ffacd0b85a97d-371946a44d3mr3306154f8f.58.1723904672745; Sat, 17 Aug 2024
 07:24:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240814125525.3917130-2-crwulff@gmail.com> <294f091e-aa0c-4f1d-b827-db3339a0a8af@stanley.mountain>
In-Reply-To: <294f091e-aa0c-4f1d-b827-db3339a0a8af@stanley.mountain>
From: Chris Wulff <crwulff@gmail.com>
Date: Sat, 17 Aug 2024 10:24:21 -0400
Message-ID: <CAB0kiBKeBwHNm1B7RCYTK1KTUrWS4=NzTdLRV6sdDH1wqCFJHQ@mail.gmail.com>
Subject: Re: [PATCH v4] USB: gadget: f_hid: Add GET_REPORT via userspace IOCTL
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: oe-kbuild@lists.linux.dev, linux-usb@vger.kernel.org, lkp@intel.com, 
	oe-kbuild-all@lists.linux.dev, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Konstantin Aladyshev <aladyshev22@gmail.com>, 
	David Sands <david.sands@biamp.com>, Jeff Johnson <quic_jjohnson@quicinc.com>, 
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>, linux-kernel@vger.kernel.org, 
	Chris Wulff <Chris.Wulff@biamp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Aug 17, 2024 at 2:49=E2=80=AFAM Dan Carpenter <dan.carpenter@linaro=
.org> wrote:
>
> Hi,
>
> kernel test robot noticed the following build warnings:
>
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/crwulff-gmail-com/=
USB-gadget-f_hid-Add-GET_REPORT-via-userspace-IOCTL/20240814-225520
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git us=
b-testing
> patch link:    https://lore.kernel.org/r/20240814125525.3917130-2-crwulff=
%40gmail.com
> patch subject: [PATCH v4] USB: gadget: f_hid: Add GET_REPORT via userspac=
e IOCTL
> config: x86_64-randconfig-161-20240817 (https://download.01.org/0day-ci/a=
rchive/20240817/202408171146.0RjWnTq8-lkp@intel.com/config)
> compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a=
15a9eac96088ae5e9134248d8236e34b91b1)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> | Closes: https://lore.kernel.org/r/202408171146.0RjWnTq8-lkp@intel.com/
>
> smatch warnings:
> drivers/usb/gadget/function/f_hid.c:705 f_hidg_get_report() warn: inconsi=
stent returns '&hidg->get_report_spinlock'.
> drivers/usb/gadget/function/f_hid.c:705 f_hidg_get_report() warn: inconsi=
stent returns 'flags'.
>
> vim +705 drivers/usb/gadget/function/f_hid.c
>
> fce51fb916013b Chris Wulff 2024-08-14  653  static int f_hidg_get_report(=
struct file *file, struct usb_hidg_report __user *buffer)
> fce51fb916013b Chris Wulff 2024-08-14  654  {
> fce51fb916013b Chris Wulff 2024-08-14  655      struct f_hidg            =
       *hidg =3D file->private_data;
> fce51fb916013b Chris Wulff 2024-08-14  656      struct usb_composite_dev =
       *cdev =3D hidg->func.config->cdev;
> fce51fb916013b Chris Wulff 2024-08-14  657      unsigned long   flags;
> fce51fb916013b Chris Wulff 2024-08-14  658      struct report_entry *entr=
y;
> fce51fb916013b Chris Wulff 2024-08-14  659      struct report_entry *ptr;
> fce51fb916013b Chris Wulff 2024-08-14  660      __u8 report_id;
> fce51fb916013b Chris Wulff 2024-08-14  661
> fce51fb916013b Chris Wulff 2024-08-14  662      entry =3D kmalloc(sizeof(=
*entry), GFP_KERNEL);
> fce51fb916013b Chris Wulff 2024-08-14  663      if (!entry)
> fce51fb916013b Chris Wulff 2024-08-14  664              return -ENOMEM;
> fce51fb916013b Chris Wulff 2024-08-14  665
> fce51fb916013b Chris Wulff 2024-08-14  666      if (copy_from_user(&entry=
->report_data, buffer,
> fce51fb916013b Chris Wulff 2024-08-14  667                              s=
izeof(struct usb_hidg_report))) {
> fce51fb916013b Chris Wulff 2024-08-14  668              ERROR(cdev, "copy=
_from_user error\n");
> fce51fb916013b Chris Wulff 2024-08-14  669              kfree(entry);
> fce51fb916013b Chris Wulff 2024-08-14  670              return -EINVAL;
> fce51fb916013b Chris Wulff 2024-08-14  671      }
> fce51fb916013b Chris Wulff 2024-08-14  672
> fce51fb916013b Chris Wulff 2024-08-14  673      report_id =3D entry->repo=
rt_data.report_id;
> fce51fb916013b Chris Wulff 2024-08-14  674
> fce51fb916013b Chris Wulff 2024-08-14  675      spin_lock_irqsave(&hidg->=
get_report_spinlock, flags);
> fce51fb916013b Chris Wulff 2024-08-14  676      ptr =3D f_hidg_search_for=
_report(hidg, report_id);
> fce51fb916013b Chris Wulff 2024-08-14  677
> fce51fb916013b Chris Wulff 2024-08-14  678      if (ptr) {
> fce51fb916013b Chris Wulff 2024-08-14  679              /* Report already=
 exists in list - update it */
> fce51fb916013b Chris Wulff 2024-08-14  680              if (copy_from_use=
r(&ptr->report_data, buffer,
> fce51fb916013b Chris Wulff 2024-08-14  681                              s=
izeof(struct usb_hidg_report))) {
> fce51fb916013b Chris Wulff 2024-08-14  682                      ERROR(cde=
v, "copy_from_user error\n");
> fce51fb916013b Chris Wulff 2024-08-14  683                      kfree(ent=
ry);
> fce51fb916013b Chris Wulff 2024-08-14  684                      return -E=
INVAL;
>
> spin_unlock_irqrestore(&hidg->get_report_spinlock, flags);

This does appear to be legitimate. I will make sure the spinlock is
released on that error path and post a new version.

>
> fce51fb916013b Chris Wulff 2024-08-14  685              }
> fce51fb916013b Chris Wulff 2024-08-14  686              kfree(entry);
> fce51fb916013b Chris Wulff 2024-08-14  687      } else {
> fce51fb916013b Chris Wulff 2024-08-14  688              /* Report does no=
t exist in list - add it */
> fce51fb916013b Chris Wulff 2024-08-14  689              list_add_tail(&en=
try->node, &hidg->report_list);
> fce51fb916013b Chris Wulff 2024-08-14  690      }
> fce51fb916013b Chris Wulff 2024-08-14  691
> fce51fb916013b Chris Wulff 2024-08-14  692      /* If there is no respons=
e pending then do nothing further */
> fce51fb916013b Chris Wulff 2024-08-14  693      if (hidg->get_report_retu=
rned) {
> fce51fb916013b Chris Wulff 2024-08-14  694              spin_unlock_irqre=
store(&hidg->get_report_spinlock, flags);
> fce51fb916013b Chris Wulff 2024-08-14  695              return 0;
> fce51fb916013b Chris Wulff 2024-08-14  696      }
> fce51fb916013b Chris Wulff 2024-08-14  697
> fce51fb916013b Chris Wulff 2024-08-14  698      /* If this userspace resp=
onse serves the current pending report */
> fce51fb916013b Chris Wulff 2024-08-14  699      if (hidg->get_report_req_=
report_id =3D=3D report_id) {
> fce51fb916013b Chris Wulff 2024-08-14  700              hidg->get_report_=
returned =3D true;
> fce51fb916013b Chris Wulff 2024-08-14  701              wake_up(&hidg->ge=
t_queue);
> fce51fb916013b Chris Wulff 2024-08-14  702      }
> fce51fb916013b Chris Wulff 2024-08-14  703
> fce51fb916013b Chris Wulff 2024-08-14  704      spin_unlock_irqrestore(&h=
idg->get_report_spinlock, flags);
> fce51fb916013b Chris Wulff 2024-08-14 @705      return 0;
> fce51fb916013b Chris Wulff 2024-08-14  706  }
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
>
