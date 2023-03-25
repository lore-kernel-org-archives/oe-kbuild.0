Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D06C939B;
	Sat, 25 Mar 2023 17:04:39 +0000 (UTC)
Received: by mail-ed1-f54.google.com with SMTP id x3so19721907edb.10;
        Sat, 25 Mar 2023 10:04:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679763878;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Wh8Vxm+9lurFsruhK/8nNRb/9+vLUcqW5Y89wM9tlkQ=;
        b=RP4tPhyM4Now7Cdr2wnYsHFAE7BtVLTd+SxjXNqAqR0wizH5LHrrrzWlA0UG7QT1c4
         HHM7G25JM76Lw/XzmlvLrfcttycsm3BAwFbyj6g7biXi3dbTi3Jz803ipNUhBvzFbOQt
         5EPWTzGOYOaDr5hBNI5IO8wvFHht45GCjVeLvUkm3AblJ+ipz/biQqS23krImF+kXy/o
         HiwWwR/bjYwNpNGwc4WtL7YFlCwfurmyirHgetuHtEHkITJ12tBTy7Q1wuU0NXo8rF9y
         BV2R7s72TWPuZj9hu9rKaocHqNzix8zAKnorJO0VVxeGvFw7SQ7c06nxaTDTGFUe3sWK
         QYbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679763878;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Wh8Vxm+9lurFsruhK/8nNRb/9+vLUcqW5Y89wM9tlkQ=;
        b=4zhAmNdOkYSjFML2XgZG7GAnstxph2TDHpSoBQo1AiEz2UaykvYWGDRQBucpFJnK8b
         XCzKejxtD4o854lL6XNIs86sO0NNCjnlbXd+SOcWW8UfjLN5kvMwMiYU+Kx3YrR4kV3m
         McCPZtcrtTm5fG1E2qtga0esqVzAzvBoO7lb1WlUFdlkO8D7oAAyNkxMn4sD0fiXBNMv
         HaS/dMqpkAEcXDmi2oSH1oNBh7sF1yZZOOFVDWxmnUooC1lBUVkhhk07ctO8ybZ5vMBK
         GsNkKk9JHNsEVcz0HgbhJnlVxAkw08G8G3RXz5DgDQzC6wKuRAm70KRpoCDrpZmMrLvt
         NhXw==
X-Gm-Message-State: AAQBX9eX4JUDv7BHdxKjB4MIfwUBkNlPkKMfl4KhMxIMft09gkgWLs2l
	m9qXj2W8JjXSsFWs/o8FoyNaOoBdTX6QjnBL4Rc=
X-Google-Smtp-Source: AKy350Z49+5f/Dub0VCGK2MeBWkaFg6E3B2OgJdBki1p2Tlf9L8ScH6n8IfSqWj4LQv2o7HuOCjSudOqbsbQLJbV5/o=
X-Received: by 2002:a50:9e4b:0:b0:502:3c99:417f with SMTP id
 z69-20020a509e4b000000b005023c99417fmr489628ede.6.1679763877811; Sat, 25 Mar
 2023 10:04:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230318214953.36834-1-u9012063@gmail.com> <8ddd5e22-91e6-407d-86bc-220fce2f6e0f@kili.mountain>
In-Reply-To: <8ddd5e22-91e6-407d-86bc-220fce2f6e0f@kili.mountain>
From: William Tu <u9012063@gmail.com>
Date: Sat, 25 Mar 2023 10:03:59 -0700
Message-ID: <CALDO+SZHu3GW8BbXzdJ6A0OtY=XypYT3DG-xPP9VuERx+sYzGw@mail.gmail.com>
Subject: Re: [PATCH RFC v18 net-next] vmxnet3: Add XDP support.
To: Dan Carpenter <error27@gmail.com>
Cc: oe-kbuild@lists.linux.dev, lkp@intel.com, oe-kbuild-all@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 23, 2023 at 7:07=E2=80=AFAM Dan Carpenter <error27@gmail.com> w=
rote:
>
> Hi William,
>
> url:    https://github.com/intel-lab-lkp/linux/commits/William-Tu/vmxnet3=
-Add-XDP-support/20230319-055034
> patch link:    https://lore.kernel.org/r/20230318214953.36834-1-u9012063%=
40gmail.com
> patch subject: [PATCH RFC v18 net-next] vmxnet3: Add XDP support.
> config: s390-randconfig-m031-20230321 (https://download.01.org/0day-ci/ar=
chive/20230323/202303232106.UkMR3FEX-lkp@intel.com/config)
> compiler: s390-linux-gcc (GCC) 12.1.0
>
> If you fix the issue, kindly add following tag where applicable
> | Reported-by: kernel test robot <lkp@intel.com>
> | Reported-by: Dan Carpenter <error27@gmail.com>
> | Link: https://lore.kernel.org/r/202303232106.UkMR3FEX-lkp@intel.com/
>
> smatch warnings:
> drivers/net/vmxnet3/vmxnet3_xdp.c:362 vmxnet3_process_xdp_small() warn: v=
ariable dereferenced before check 'skb_xdp_pass' (see line 361)
> drivers/net/vmxnet3/vmxnet3_xdp.c:406 vmxnet3_process_xdp() warn: variabl=
e dereferenced before check 'skb_xdp_pass' (see line 405)
>
> vim +/skb_xdp_pass +362 drivers/net/vmxnet3/vmxnet3_xdp.c
>
> 089db7a8620943 William Tu 2023-03-18  351       rcu_read_lock();
> 089db7a8620943 William Tu 2023-03-18  352       xdp_prog =3D rcu_derefere=
nce(rq->adapter->xdp_bpf_prog);
> 089db7a8620943 William Tu 2023-03-18  353       if (!xdp_prog) {
> 089db7a8620943 William Tu 2023-03-18  354               act =3D XDP_PASS;
> 089db7a8620943 William Tu 2023-03-18  355               goto out_skb;
> 089db7a8620943 William Tu 2023-03-18  356       }
> 089db7a8620943 William Tu 2023-03-18  357       act =3D vmxnet3_run_xdp(r=
q, &xdp, xdp_prog);
> 089db7a8620943 William Tu 2023-03-18  358
> 089db7a8620943 William Tu 2023-03-18  359       if (act =3D=3D XDP_PASS) =
{
> 089db7a8620943 William Tu 2023-03-18  360  out_skb:
> 089db7a8620943 William Tu 2023-03-18 @361               *skb_xdp_pass =3D=
 vmxnet3_build_skb(rq, page, &xdp);
> 089db7a8620943 William Tu 2023-03-18 @362               if (!skb_xdp_pass=
)
>
> This should be testing if (!*skb_xdp_pass)
>
> 089db7a8620943 William Tu 2023-03-18  363                       return XD=
P_DROP;
> 089db7a8620943 William Tu 2023-03-18  364       }
> 089db7a8620943 William Tu 2023-03-18  365
> 089db7a8620943 William Tu 2023-03-18  366       /* No need to refill. */
> 089db7a8620943 William Tu 2023-03-18  367       return act;
> 089db7a8620943 William Tu 2023-03-18  368  }
> 089db7a8620943 William Tu 2023-03-18  369
> 089db7a8620943 William Tu 2023-03-18  370  int
> 089db7a8620943 William Tu 2023-03-18  371  vmxnet3_process_xdp(struct vmx=
net3_adapter *adapter,
> 089db7a8620943 William Tu 2023-03-18  372                   struct vmxnet=
3_rx_queue *rq,
> 089db7a8620943 William Tu 2023-03-18  373                   struct Vmxnet=
3_RxCompDesc *rcd,
> 089db7a8620943 William Tu 2023-03-18  374                   struct vmxnet=
3_rx_buf_info *rbi,
> 089db7a8620943 William Tu 2023-03-18  375                   struct Vmxnet=
3_RxDesc *rxd,
> 089db7a8620943 William Tu 2023-03-18  376                   struct sk_buf=
f **skb_xdp_pass)
> 089db7a8620943 William Tu 2023-03-18  377  {
> 089db7a8620943 William Tu 2023-03-18  378       struct bpf_prog *xdp_prog=
;
> 089db7a8620943 William Tu 2023-03-18  379       dma_addr_t new_dma_addr;
> 089db7a8620943 William Tu 2023-03-18  380       struct xdp_buff xdp;
> 089db7a8620943 William Tu 2023-03-18  381       struct page *page;
> 089db7a8620943 William Tu 2023-03-18  382       void *new_data;
> 089db7a8620943 William Tu 2023-03-18  383       int act;
> 089db7a8620943 William Tu 2023-03-18  384
> 089db7a8620943 William Tu 2023-03-18  385       page =3D rbi->page;
> 089db7a8620943 William Tu 2023-03-18  386       dma_sync_single_for_cpu(&=
adapter->pdev->dev,
> 089db7a8620943 William Tu 2023-03-18  387                               p=
age_pool_get_dma_addr(page) +
> 089db7a8620943 William Tu 2023-03-18  388                               r=
q->page_pool->p.offset, rcd->len,
> 089db7a8620943 William Tu 2023-03-18  389                               p=
age_pool_get_dma_dir(rq->page_pool));
> 089db7a8620943 William Tu 2023-03-18  390
> 089db7a8620943 William Tu 2023-03-18  391       xdp_init_buff(&xdp, rbi->=
len, &rq->xdp_rxq);
> 089db7a8620943 William Tu 2023-03-18  392       xdp_prepare_buff(&xdp, pa=
ge_address(page), rq->page_pool->p.offset,
> 089db7a8620943 William Tu 2023-03-18  393                        rcd->len=
, false);
> 089db7a8620943 William Tu 2023-03-18  394       xdp_buff_clear_frags_flag=
(&xdp);
> 089db7a8620943 William Tu 2023-03-18  395
> 089db7a8620943 William Tu 2023-03-18  396       xdp_prog =3D rcu_derefere=
nce(rq->adapter->xdp_bpf_prog);
> 089db7a8620943 William Tu 2023-03-18  397       if (!xdp_prog) {
> 089db7a8620943 William Tu 2023-03-18  398               act =3D XDP_PASS;
> 089db7a8620943 William Tu 2023-03-18  399               goto out_skb;
> 089db7a8620943 William Tu 2023-03-18  400       }
> 089db7a8620943 William Tu 2023-03-18  401       act =3D vmxnet3_run_xdp(r=
q, &xdp, xdp_prog);
> 089db7a8620943 William Tu 2023-03-18  402
> 089db7a8620943 William Tu 2023-03-18  403       if (act =3D=3D XDP_PASS) =
{
> 089db7a8620943 William Tu 2023-03-18  404  out_skb:
> 089db7a8620943 William Tu 2023-03-18 @405               *skb_xdp_pass =3D=
 vmxnet3_build_skb(rq, page, &xdp);
> 089db7a8620943 William Tu 2023-03-18 @406               if (!skb_xdp_pass=
)
>                                                             ^^^^^^^^^^^^^
> Same.
>
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests
>

Hi Dan,
Thanks for picking up this patch and testing it!
I will fix the two places and resend.
William
