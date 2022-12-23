Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69A7017CD;
	Fri, 23 Dec 2022 11:06:42 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id n3so3522329wrc.5;
        Fri, 23 Dec 2022 03:06:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=y5h5oijVdAD7LQryRU63K0tpjFtTcimuzIYIZSg7TGA=;
        b=VvXG+YNj7RfVuonjMqTpPGeTtJqV1cgsWNKrPJAVYZIWkI669TwCfamQk8/NFyExcP
         xltZYtONOEfvCagrmsu0VS/w6fmZa4v2TXQXVKyacEYv2wpoBuW29UROtzUK9t3CX3ar
         2gm7OdQGU82wSLR+lG+JECy1MpdhuEBUk5HbCyIs0CDKFfWLXVSVd32ATXFuSK14l0D+
         D2NoLKoONnROoaN4c81vKToCsqr5wCT0PusxhTKecrNGZWP7DIbIfb6JtVE+V0N2ERNC
         2km5jjpTI8ln+teEuG/iE4jcEWLv4LP2dcXdXMF7Yd30aCuIs6XwX8Pvec3MssKWeGHH
         pB4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:message-id:subject:cc:to:from:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=y5h5oijVdAD7LQryRU63K0tpjFtTcimuzIYIZSg7TGA=;
        b=4rUQvc8Nmtr2GFIQVnBZDzoFKnFLnDNZklIEnl7Wy2eiDruqonByFjdem6QLgTE+TX
         54bZXG46USr5IGr3kQYzkS+z9PrwI2bUcgiyA1+gKxnNb/Gd8mZbE9ZTnA54zERn3dXc
         jYw20FG3TJMH5czdTx3OEDYcCE10GWdEzkM33xwt7y7vMQkpMKjboLv/2UpEkoT64B9o
         pqiI9ohP00JD9ChVovZOY45S6P1wGynGS28dGKpUH35OP6lRk5+aEOzaj3/qdD7RN5Hp
         S2K+nFnRPmpMz8r5qkipyhRWIBKShSrcGuvwqVFzaBzdjbz+XmM/EulzZQdLZnSk4XZf
         A6VA==
X-Gm-Message-State: AFqh2kq9zWTDr8XnU90l9XVoX5w5Dwn53XwJ41h0aPNfAR7GP+5OhlC+
	ozj7FDLo+tVycnU3XX1rhZRbHyNnWinMqg==
X-Google-Smtp-Source: AMrXdXvJVZ9RNdqux2rXOp5cJhkAYSvS1D/5OJNNYn+zpI4a8Bua4wu4jFu5wJ/YvhCFHlZU8vNytw==
X-Received: by 2002:adf:e703:0:b0:26a:5b49:829a with SMTP id c3-20020adfe703000000b0026a5b49829amr6746433wrm.33.1671793600265;
        Fri, 23 Dec 2022 03:06:40 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id c10-20020a5d414a000000b0024242111a27sm2864872wrq.75.2022.12.23.03.06.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Dec 2022 03:06:39 -0800 (PST)
Date: Fri, 23 Dec 2022 14:06:23 +0300
From: Dan Carpenter <error27@gmail.com>
To: oe-kbuild@lists.linux.dev, Jessica Zhang <quic_jesszhan@quicinc.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH v2 2/3] drm: Adjust atomic checks for solid fill color
Message-ID: <202212231429.0dkIeJCg-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221222221441.6980-3-quic_jesszhan@quicinc.com>
Message-ID: <20221223110623.vmoOZIxgC4RNUpOX4Im5V6IGuAst7ro0IIk03Ca1JWg@z>

Hi Jessica,

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jessica-Zhang/drm-Introduce-solid-fill-property-for-drm-plane/20221223-061634
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/20221222221441.6980-3-quic_jesszhan%40quicinc.com
patch subject: [RFC PATCH v2 2/3] drm: Adjust atomic checks for solid fill color
config: m68k-randconfig-m041-20221218
compiler: m68k-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>

smatch warnings:
drivers/gpu/drm/drm_atomic.c:692 drm_atomic_plane_check() error: uninitialized symbol 'fb_width'.
drivers/gpu/drm/drm_atomic.c:693 drm_atomic_plane_check() error: uninitialized symbol 'fb_height'.

vim +/fb_width +692 drivers/gpu/drm/drm_atomic.c

f8aeb41c4b7e9d Daniel Vetter    2015-08-26  582  
5e743737421fe9 Rob Clark        2014-12-18  583  /**
5e743737421fe9 Rob Clark        2014-12-18  584   * drm_atomic_plane_check - check plane state
d9be05b784225e Ville Syrjälä    2018-11-06  585   * @old_plane_state: old plane state to check
d9be05b784225e Ville Syrjälä    2018-11-06  586   * @new_plane_state: new plane state to check
5e743737421fe9 Rob Clark        2014-12-18  587   *
5e743737421fe9 Rob Clark        2014-12-18  588   * Provides core sanity checks for plane state.
5e743737421fe9 Rob Clark        2014-12-18  589   *
5e743737421fe9 Rob Clark        2014-12-18  590   * RETURNS:
5e743737421fe9 Rob Clark        2014-12-18  591   * Zero on success, error code on failure
5e743737421fe9 Rob Clark        2014-12-18  592   */
d9be05b784225e Ville Syrjälä    2018-11-06  593  static int drm_atomic_plane_check(const struct drm_plane_state *old_plane_state,
d9be05b784225e Ville Syrjälä    2018-11-06  594  				  const struct drm_plane_state *new_plane_state)
5e743737421fe9 Rob Clark        2014-12-18  595  {
d9be05b784225e Ville Syrjälä    2018-11-06  596  	struct drm_plane *plane = new_plane_state->plane;
d9be05b784225e Ville Syrjälä    2018-11-06  597  	struct drm_crtc *crtc = new_plane_state->crtc;
d9be05b784225e Ville Syrjälä    2018-11-06  598  	const struct drm_framebuffer *fb = new_plane_state->fb;
5e743737421fe9 Rob Clark        2014-12-18  599  	unsigned int fb_width, fb_height;
d3b21767821ed3 Lukasz Spintzyk  2018-05-23  600  	struct drm_mode_rect *clips;
d3b21767821ed3 Lukasz Spintzyk  2018-05-23  601  	uint32_t num_clips;
ead8610d42105a Laurent Pinchart 2015-03-05  602  	int ret;
5e743737421fe9 Rob Clark        2014-12-18  603  
1d73dbcfc1c7f9 Jessica Zhang    2022-12-22  604  	/* When solid_fill is disabled,
1d73dbcfc1c7f9 Jessica Zhang    2022-12-22  605  	 * either *both* CRTC and FB must be set, or neither
1d73dbcfc1c7f9 Jessica Zhang    2022-12-22  606  	 */
1d73dbcfc1c7f9 Jessica Zhang    2022-12-22  607  	if (crtc && !fb && !new_plane_state->solid_fill_blob) {
6e22dc35837790 Claudio Suarez   2021-11-26  608  		drm_dbg_atomic(plane->dev, "[PLANE:%d:%s] CRTC set but no FB\n",
b6f690ab237d80 Ville Syrjälä    2018-06-11  609  			       plane->base.id, plane->name);
5e743737421fe9 Rob Clark        2014-12-18  610  		return -EINVAL;
d9be05b784225e Ville Syrjälä    2018-11-06  611  	} else if (fb && !crtc) {
6e22dc35837790 Claudio Suarez   2021-11-26  612  		drm_dbg_atomic(plane->dev, "[PLANE:%d:%s] FB set but no CRTC\n",
b6f690ab237d80 Ville Syrjälä    2018-06-11  613  			       plane->base.id, plane->name);
5e743737421fe9 Rob Clark        2014-12-18  614  		return -EINVAL;
5e743737421fe9 Rob Clark        2014-12-18  615  	}
5e743737421fe9 Rob Clark        2014-12-18  616  
5e743737421fe9 Rob Clark        2014-12-18  617  	/* if disabled, we don't care about the rest of the state: */
d9be05b784225e Ville Syrjälä    2018-11-06  618  	if (!crtc)
5e743737421fe9 Rob Clark        2014-12-18  619  		return 0;
5e743737421fe9 Rob Clark        2014-12-18  620  
5e743737421fe9 Rob Clark        2014-12-18  621  	/* Check whether this plane is usable on this CRTC */
d9be05b784225e Ville Syrjälä    2018-11-06  622  	if (!(plane->possible_crtcs & drm_crtc_mask(crtc))) {
6e22dc35837790 Claudio Suarez   2021-11-26  623  		drm_dbg_atomic(plane->dev,
6e22dc35837790 Claudio Suarez   2021-11-26  624  			       "Invalid [CRTC:%d:%s] for [PLANE:%d:%s]\n",
d9be05b784225e Ville Syrjälä    2018-11-06  625  			       crtc->base.id, crtc->name,
b6f690ab237d80 Ville Syrjälä    2018-06-11  626  			       plane->base.id, plane->name);
5e743737421fe9 Rob Clark        2014-12-18  627  		return -EINVAL;
5e743737421fe9 Rob Clark        2014-12-18  628  	}
5e743737421fe9 Rob Clark        2014-12-18  629  
5e743737421fe9 Rob Clark        2014-12-18  630  	/* Check whether this plane supports the fb pixel format. */
1d73dbcfc1c7f9 Jessica Zhang    2022-12-22  631  	if (fb) {
d9be05b784225e Ville Syrjälä    2018-11-06  632  		ret = drm_plane_check_pixel_format(plane, fb->format->format,
d9be05b784225e Ville Syrjälä    2018-11-06  633  						   fb->modifier);
1d73dbcfc1c7f9 Jessica Zhang    2022-12-22  634  
ead8610d42105a Laurent Pinchart 2015-03-05  635  		if (ret) {
6e22dc35837790 Claudio Suarez   2021-11-26  636  			drm_dbg_atomic(plane->dev,
6e22dc35837790 Claudio Suarez   2021-11-26  637  				       "[PLANE:%d:%s] invalid pixel format %p4cc, modifier 0x%llx\n",
b6f690ab237d80 Ville Syrjälä    2018-06-11  638  				       plane->base.id, plane->name,
92f1d09ca4ed4a Sakari Ailus     2021-02-16  639  				       &fb->format->format, fb->modifier);
ead8610d42105a Laurent Pinchart 2015-03-05  640  			return ret;
5e743737421fe9 Rob Clark        2014-12-18  641  		}
1d73dbcfc1c7f9 Jessica Zhang    2022-12-22  642  	}
5e743737421fe9 Rob Clark        2014-12-18  643  
5e743737421fe9 Rob Clark        2014-12-18  644  	/* Give drivers some help against integer overflows */
d9be05b784225e Ville Syrjälä    2018-11-06  645  	if (new_plane_state->crtc_w > INT_MAX ||
d9be05b784225e Ville Syrjälä    2018-11-06  646  	    new_plane_state->crtc_x > INT_MAX - (int32_t) new_plane_state->crtc_w ||
d9be05b784225e Ville Syrjälä    2018-11-06  647  	    new_plane_state->crtc_h > INT_MAX ||
d9be05b784225e Ville Syrjälä    2018-11-06  648  	    new_plane_state->crtc_y > INT_MAX - (int32_t) new_plane_state->crtc_h) {
6e22dc35837790 Claudio Suarez   2021-11-26  649  		drm_dbg_atomic(plane->dev,
6e22dc35837790 Claudio Suarez   2021-11-26  650  			       "[PLANE:%d:%s] invalid CRTC coordinates %ux%u+%d+%d\n",
b6f690ab237d80 Ville Syrjälä    2018-06-11  651  			       plane->base.id, plane->name,
d9be05b784225e Ville Syrjälä    2018-11-06  652  			       new_plane_state->crtc_w, new_plane_state->crtc_h,
d9be05b784225e Ville Syrjälä    2018-11-06  653  			       new_plane_state->crtc_x, new_plane_state->crtc_y);
5e743737421fe9 Rob Clark        2014-12-18  654  		return -ERANGE;
5e743737421fe9 Rob Clark        2014-12-18  655  	}
5e743737421fe9 Rob Clark        2014-12-18  656  
1d73dbcfc1c7f9 Jessica Zhang    2022-12-22  657  	if (fb) {
d9be05b784225e Ville Syrjälä    2018-11-06  658  		fb_width = fb->width << 16;
d9be05b784225e Ville Syrjälä    2018-11-06  659  		fb_height = fb->height << 16;
5e743737421fe9 Rob Clark        2014-12-18  660  
5e743737421fe9 Rob Clark        2014-12-18  661  		/* Make sure source coordinates are inside the fb. */
d9be05b784225e Ville Syrjälä    2018-11-06  662  		if (new_plane_state->src_w > fb_width ||
d9be05b784225e Ville Syrjälä    2018-11-06  663  		    new_plane_state->src_x > fb_width - new_plane_state->src_w ||
d9be05b784225e Ville Syrjälä    2018-11-06  664  		    new_plane_state->src_h > fb_height ||
d9be05b784225e Ville Syrjälä    2018-11-06  665  		    new_plane_state->src_y > fb_height - new_plane_state->src_h) {
6e22dc35837790 Claudio Suarez   2021-11-26  666  			drm_dbg_atomic(plane->dev,
6e22dc35837790 Claudio Suarez   2021-11-26  667  				       "[PLANE:%d:%s] invalid source coordinates "
0338f0d0d70a26 Ville Syrjälä    2017-11-01  668  				       "%u.%06ux%u.%06u+%u.%06u+%u.%06u (fb %ux%u)\n",
b6f690ab237d80 Ville Syrjälä    2018-06-11  669  				       plane->base.id, plane->name,
d9be05b784225e Ville Syrjälä    2018-11-06  670  				       new_plane_state->src_w >> 16,
d9be05b784225e Ville Syrjälä    2018-11-06  671  				       ((new_plane_state->src_w & 0xffff) * 15625) >> 10,
d9be05b784225e Ville Syrjälä    2018-11-06  672  				       new_plane_state->src_h >> 16,
d9be05b784225e Ville Syrjälä    2018-11-06  673  				       ((new_plane_state->src_h & 0xffff) * 15625) >> 10,
d9be05b784225e Ville Syrjälä    2018-11-06  674  				       new_plane_state->src_x >> 16,
d9be05b784225e Ville Syrjälä    2018-11-06  675  				       ((new_plane_state->src_x & 0xffff) * 15625) >> 10,
d9be05b784225e Ville Syrjälä    2018-11-06  676  				       new_plane_state->src_y >> 16,
d9be05b784225e Ville Syrjälä    2018-11-06  677  				       ((new_plane_state->src_y & 0xffff) * 15625) >> 10,
d9be05b784225e Ville Syrjälä    2018-11-06  678  				       fb->width, fb->height);
5e743737421fe9 Rob Clark        2014-12-18  679  			return -ENOSPC;
5e743737421fe9 Rob Clark        2014-12-18  680  		}
1d73dbcfc1c7f9 Jessica Zhang    2022-12-22  681  	}

fb_width and fb_height are uninitialized on else path.

5e743737421fe9 Rob Clark        2014-12-18  682  
c7fcbf25139732 Daniel Vetter    2021-07-23  683  	clips = __drm_plane_get_damage_clips(new_plane_state);
d3b21767821ed3 Lukasz Spintzyk  2018-05-23  684  	num_clips = drm_plane_get_damage_clips_count(new_plane_state);
d3b21767821ed3 Lukasz Spintzyk  2018-05-23  685  
d3b21767821ed3 Lukasz Spintzyk  2018-05-23  686  	/* Make sure damage clips are valid and inside the fb. */
d3b21767821ed3 Lukasz Spintzyk  2018-05-23  687  	while (num_clips > 0) {
d3b21767821ed3 Lukasz Spintzyk  2018-05-23  688  		if (clips->x1 >= clips->x2 ||
d3b21767821ed3 Lukasz Spintzyk  2018-05-23  689  		    clips->y1 >= clips->y2 ||
d3b21767821ed3 Lukasz Spintzyk  2018-05-23  690  		    clips->x1 < 0 ||
d3b21767821ed3 Lukasz Spintzyk  2018-05-23  691  		    clips->y1 < 0 ||
d3b21767821ed3 Lukasz Spintzyk  2018-05-23 @692  		    clips->x2 > fb_width ||
d3b21767821ed3 Lukasz Spintzyk  2018-05-23 @693  		    clips->y2 > fb_height) {
                                                                                ^^^^^^^^^

6e22dc35837790 Claudio Suarez   2021-11-26  694  			drm_dbg_atomic(plane->dev,
6e22dc35837790 Claudio Suarez   2021-11-26  695  				       "[PLANE:%d:%s] invalid damage clip %d %d %d %d\n",
d3b21767821ed3 Lukasz Spintzyk  2018-05-23  696  				       plane->base.id, plane->name, clips->x1,
d3b21767821ed3 Lukasz Spintzyk  2018-05-23  697  				       clips->y1, clips->x2, clips->y2);
d3b21767821ed3 Lukasz Spintzyk  2018-05-23  698  			return -EINVAL;
d3b21767821ed3 Lukasz Spintzyk  2018-05-23  699  		}
d3b21767821ed3 Lukasz Spintzyk  2018-05-23  700  		clips++;
d3b21767821ed3 Lukasz Spintzyk  2018-05-23  701  		num_clips--;
d3b21767821ed3 Lukasz Spintzyk  2018-05-23  702  	}
d3b21767821ed3 Lukasz Spintzyk  2018-05-23  703  
d9be05b784225e Ville Syrjälä    2018-11-06  704  	if (plane_switching_crtc(old_plane_state, new_plane_state)) {
6e22dc35837790 Claudio Suarez   2021-11-26  705  		drm_dbg_atomic(plane->dev,
6e22dc35837790 Claudio Suarez   2021-11-26  706  			       "[PLANE:%d:%s] switching CRTC directly\n",
9f4c97a236d35b Ville Syrjälä    2015-12-08  707  			       plane->base.id, plane->name);
f8aeb41c4b7e9d Daniel Vetter    2015-08-26  708  		return -EINVAL;
f8aeb41c4b7e9d Daniel Vetter    2015-08-26  709  	}
f8aeb41c4b7e9d Daniel Vetter    2015-08-26  710  
5e743737421fe9 Rob Clark        2014-12-18  711  	return 0;
5e743737421fe9 Rob Clark        2014-12-18  712  }

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

