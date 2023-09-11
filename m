Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D8F88BFA;
	Mon, 11 Sep 2023 23:45:01 +0000 (UTC)
Received: from [192.168.2.112] (109-252-153-31.dynamic.spd-mgts.ru [109.252.153.31])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: dmitry.osipenko)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 9DF3A66072FD;
	Tue, 12 Sep 2023 00:44:58 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1694475900;
	bh=WkotUAC8lDAjycWqSJXebM742z0pXxUqQkHS57KhQSQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=TkH+MPbx6TY/R6uMAKG41NtKuJONwdQE7fCB1AZDH8nNT0/TvmVbleNAz3h/bxL8B
	 wRsPtGqCMtzo6HPppFPG9S0l/sEZhGwPU/ioIAmCPUWFE8Pvt/WeA2JO3yb1V+HHZJ
	 eWJEBzc3j0XTSATB+o4hwKBuZriHRYgMgwwx/Oq0LzaVuMOjafdVFz9uCrPPx5QHoP
	 yS+nJH0ewVf+CXQGOXcYIcXME1DGvi5amRDYx+4MXoXVUeS7H6SK3thkwDJXTwIGhU
	 qvKW7QanB2V1rbVCcizQIQWiyl97HCLt/OaWYGVtK2v+eIRoH14R6FvXIFz8NjrTzk
	 QzUYVJVi3Xf7w==
Message-ID: <ac995ee3-9819-9b10-a7ae-642720828b32@collabora.com>
Date: Tue, 12 Sep 2023 02:44:55 +0300
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v16 15/20] drm/shmem-helper: Add memory shrinker
Content-Language: en-US
To: Dan Carpenter <dan.carpenter@linaro.org>, oe-kbuild@lists.linux.dev,
 David Airlie <airlied@gmail.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>, Chia-I Wu
 <olvaffe@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Qiang Yu <yuq825@gmail.com>, Steven Price <steven.price@arm.com>,
 Boris Brezillon <bbrezillon@kernel.org>, Emma Anholt <emma@anholt.net>,
 Melissa Wen <mwen@igalia.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev, kernel@collabora.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org
References: <55952e5b-8c55-4888-ba22-eda33525c3b9@kadam.mountain>
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <55952e5b-8c55-4888-ba22-eda33525c3b9@kadam.mountain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/7/23 13:03, Dan Carpenter wrote:
> 2c607edf57db6a Dmitry Osipenko 2023-09-03 @724  	if (page_offset >= num_pages || (!shmem->pages && !shmem->evicted)) {
>                                                                                           ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> Should this be || instead of &&?  (The other thing that people do is
> add "!shmem->evicted" for readability even though it doesn't need to be
> checked.  So maybe that's the issue, but the checker assumes it needs to
> be checked).
> 
> d611b4a0907cec Neil Roberts    2021-02-23  725  		ret = VM_FAULT_SIGBUS;
> d611b4a0907cec Neil Roberts    2021-02-23  726  	} else {
> 2c607edf57db6a Dmitry Osipenko 2023-09-03  727  		err = drm_gem_shmem_swapin_locked(shmem);
> 
> Or maybe it's because the kbuild bot can't use the cross function db
> and shmem->pages is assigned here?

Should be a function db problem. The shmem->pages won't be NULL if
drm_gem_shmem_swapin_locked() succeeds.

-- 
Best regards,
Dmitry

