Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 405561D1744
	for <oe-kbuild@lists.linux.dev>; Mon, 21 Oct 2024 07:26:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729495590; cv=none; b=WH4i5MHFV1XmtFf7Q/XKlZ15zTNLd8y/3CriNwcbshQg09vxZLS0P8cpZoBV7JFLV9/1hK6oXOKAlcPwxrd7jFecloXTWiKg3VvLZAMPiTd3GFSFOHAjJh0Tlizrua06hiWb+TUEx1Hm6upetGOtRQEwoVdnuUtbm/GIOhhprLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729495590; c=relaxed/simple;
	bh=wcTkMgi7iBvojm44oD0zd50eV0TUlF7xRf+s2cIomW4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=TFCyUQstp0QoB4ljzrbNcKqry968IS+rbbO6sMZ0bIhvO7liq+FvWAdVAGe+409WAUGzRQv50u9XNpB17Iw66r8u51hfuFKqY2VvPwRxQFYNAlDy3B5kDLPC7+M0GnkCVUy7jf/0eIRL5vkVFwRS2M6bZTbxNqX41/QvAnsV3CU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HJGcqj5U; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HJGcqj5U"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-37d538fe5f2so3215453f8f.2
        for <oe-kbuild@lists.linux.dev>; Mon, 21 Oct 2024 00:26:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729495586; x=1730100386; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=WzxieUov7gUMeB2aP814TI9QYjdp88kKTPX9D7imhU4=;
        b=HJGcqj5UmlBUoRWpf+MdVrJPxAJru73SQs2GpVfJA4p9SU+BkdvlBFSmfxtruB6CGa
         Il9gvcopSUw2SMnSBiZxltZ4Ej4yTf+0LmgD2viWBoQnLL2rhCLYX6ozaA5HWyYoOPnR
         Bvd7S+56kFRaxdmT22g8uFe803gDfXl5d5HibW8PcvRSYxCb84Q4dh9I4nK9nbmDKy8m
         8cxyMkm/NqCo6z6jggiOAomvQ/ZC9E309bEep+/7QZr/rirgh+f7w17fzUbVRvHL5aKZ
         WSk0jfY8j7xkiffJABoseS9ELQPR81tSC8grpGjvEuvHfMTAbF6SNJmE7PpV3xlDyi5W
         BvCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729495586; x=1730100386;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WzxieUov7gUMeB2aP814TI9QYjdp88kKTPX9D7imhU4=;
        b=k3+MlBUs9I9stpfPNz6BKrwVfIqH/PPjzdd+hlX1nIc2jH4WeufRI45Gu0Tp2gAtKi
         7bQ3kwdFi8A+AjFTZ/bpRGqKp+FOI4kP1Cm+SkQG1roUsRIRTEkEGe8Fnl1k5IZe06rj
         B0+GQD3g6nBLe0EcBc7mBxTJ8vzgSevoQUozbmqG+LQ8+Uqnj9bw65ohwuxRn1QeeUKn
         0nyUrRyT7qIk6IGCKVcra5O+06zHaN9YtdAPxbynGkcELQjkymIDIFbYqVFhUGPB3Yxa
         1B4jrYskiXpqYxly2Vt25IIE7rQgd4Xf5nLFIY7RyhV1D093EffIxnbEyqhlAfo7xVvc
         pJUg==
X-Gm-Message-State: AOJu0YybCdmk6ZtGU7RHy6sTFYrPrEairUjWewKmu2Z47p/THu8beaAK
	IBM+orm6PAu5N7kbKtez+feyPGMf5/o8bMNmusRcddqc3xCGt3wfDk5t0ge5WlyGWDqcH9gnvsI
	m
X-Google-Smtp-Source: AGHT+IGRWrE0//mu6WZwxi/0r2C3AHfF6+eS6gx1UzTzYGI7pL3TplO6Tw+K257ZLYnvYye8kQkAuQ==
X-Received: by 2002:a5d:4983:0:b0:37d:4d31:e86c with SMTP id ffacd0b85a97d-37eb487a580mr6500095f8f.44.1729495586128;
        Mon, 21 Oct 2024 00:26:26 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37ee0b9baa7sm3523765f8f.96.2024.10.21.00.26.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Oct 2024 00:26:25 -0700 (PDT)
Date: Mon, 21 Oct 2024 10:26:22 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Yunfei Dong <yunfei.dong@mediatek.com>,
	=?iso-8859-1?Q?N=EDcolas_F_=2E_R_=2E_A_=2E?= Prado <nfraprado@collabora.com>,
	Sebastian Fricke <sebastian.fricke@collabora.com>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Nathan Hebert <nhebert@chromium.org>,
	Daniel Almeida <daniel.almeida@collabora.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Hsin-Yi Wang <hsinyi@chromium.org>,
	Fritz Koenig <frkoenig@chromium.org>,
	Daniel Vetter <daniel@ffwll.ch>, Steve Cho <stevecho@chromium.org>,
	Yunfei Dong <yunfei.dong@mediatek.com>, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [PATCH v5 1/5] media: mediatek: vcodec: setting request complete
 before buffer done
Message-ID: <f08b11c7-43b7-4fe5-be36-f069527cbd69@stanley.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241012064333.27269-2-yunfei.dong@mediatek.com>

Hi Yunfei,

kernel test robot noticed the following build warnings:

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Yunfei-Dong/media-mediatek-vcodec-setting-request-complete-before-buffer-done/20241012-144607
base:   git://linuxtv.org/media_tree.git master
patch link:    https://lore.kernel.org/r/20241012064333.27269-2-yunfei.dong%40mediatek.com
patch subject: [PATCH v5 1/5] media: mediatek: vcodec: setting request complete before buffer done
config: arm-randconfig-r072-20241016 (https://download.01.org/0day-ci/archive/20241019/202410192150.2YkqysDO-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.1.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202410192150.2YkqysDO-lkp@intel.com/

smatch warnings:
drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless.c:272 mtk_vdec_stateless_cap_to_disp() warn: variable dereferenced before check 'vb2_v4l2_src' (see line 268)

vim +/vb2_v4l2_src +272 drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless.c

01abf5fbb081c0 drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_stateless.c         Yunfei Dong 2023-07-29  247  static void mtk_vdec_stateless_cap_to_disp(struct mtk_vcodec_dec_ctx *ctx, int error,
5c46486b8d2760 drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless.c Yunfei Dong 2024-10-12  248  					   struct vb2_v4l2_buffer *vb2_v4l2_src)
8cdc3794b2e34b drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_stateless.c              Yunfei Dong 2021-08-06  249  {
7b182b8d9c8523 drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_stateless.c         Yunfei Dong 2022-05-12  250  	struct vb2_v4l2_buffer *vb2_dst;
7b182b8d9c8523 drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_stateless.c         Yunfei Dong 2022-05-12  251  	enum vb2_buffer_state state;
5c46486b8d2760 drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless.c Yunfei Dong 2024-10-12  252  	struct media_request *src_buf_req;
8cdc3794b2e34b drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_stateless.c              Yunfei Dong 2021-08-06  253  
7b182b8d9c8523 drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_stateless.c         Yunfei Dong 2022-05-12  254  	if (error)
7b182b8d9c8523 drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_stateless.c         Yunfei Dong 2022-05-12  255  		state = VB2_BUF_STATE_ERROR;
7b182b8d9c8523 drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_stateless.c         Yunfei Dong 2022-05-12  256  	else
7b182b8d9c8523 drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_stateless.c         Yunfei Dong 2022-05-12  257  		state = VB2_BUF_STATE_DONE;
7b182b8d9c8523 drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_stateless.c         Yunfei Dong 2022-05-12  258  
7b182b8d9c8523 drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_stateless.c         Yunfei Dong 2022-05-12  259  	vb2_dst = v4l2_m2m_dst_buf_remove(ctx->m2m_ctx);
d879f770e4d1d5 drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_stateless.c         Yunfei Dong 2022-11-17  260  	if (vb2_dst) {
7b182b8d9c8523 drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_stateless.c         Yunfei Dong 2022-05-12  261  		v4l2_m2m_buf_done(vb2_dst, state);
41f03c673cb7b5 drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_stateless.c         Yunfei Dong 2023-07-29  262  		mtk_v4l2_vdec_dbg(2, ctx, "free frame buffer id:%d to done list",
7b182b8d9c8523 drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_stateless.c         Yunfei Dong 2022-05-12  263  				  vb2_dst->vb2_buf.index);
d879f770e4d1d5 drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_stateless.c         Yunfei Dong 2022-11-17  264  	} else {
41f03c673cb7b5 drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_stateless.c         Yunfei Dong 2023-07-29  265  		mtk_v4l2_vdec_err(ctx, "dst buffer is NULL");
d879f770e4d1d5 drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_stateless.c         Yunfei Dong 2022-11-17  266  	}
7b182b8d9c8523 drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_stateless.c         Yunfei Dong 2022-05-12  267  
5c46486b8d2760 drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless.c Yunfei Dong 2024-10-12 @268  	src_buf_req = vb2_v4l2_src->vb2_buf.req_obj.req;
                                                                                                                                      ^^^^^^^^^^^^^^^
Dereference

7b182b8d9c8523 drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_stateless.c         Yunfei Dong 2022-05-12  269  	if (src_buf_req)
7b182b8d9c8523 drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_stateless.c         Yunfei Dong 2022-05-12  270  		v4l2_ctrl_request_complete(src_buf_req, &ctx->ctrl_hdl);
5c46486b8d2760 drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless.c Yunfei Dong 2024-10-12  271  
5c46486b8d2760 drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless.c Yunfei Dong 2024-10-12 @272  	if (vb2_v4l2_src)
                                                                                                                            ^^^^^^^^^^^^
Checked too late

5c46486b8d2760 drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless.c Yunfei Dong 2024-10-12  273  		v4l2_m2m_buf_done(vb2_v4l2_src, state);
7b182b8d9c8523 drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_stateless.c         Yunfei Dong 2022-05-12  274  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

