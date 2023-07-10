Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D5AC53BE;
	Mon, 10 Jul 2023 07:36:29 +0000 (UTC)
Received: from loongson.cn (unknown [10.20.42.43])
	by gateway (Coremail) with SMTP id _____8AxCPL8tKtkGAADAA--.8813S3;
	Mon, 10 Jul 2023 15:36:28 +0800 (CST)
Received: from [10.20.42.43] (unknown [10.20.42.43])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8DxJ834tKtkW+smAA--.43572S3;
	Mon, 10 Jul 2023 15:36:25 +0800 (CST)
Message-ID: <b9c69249-7a79-836f-b673-a81965e2e9df@loongson.cn>
Date: Mon, 10 Jul 2023 15:36:24 +0800
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [drm-misc:drm-misc-next 2/3]
 drivers/gpu/drm/loongson/lsdc_plane.c:199
 lsdc_cursor_plane_atomic_async_check() warn: variable dereferenced before
 check 'state' (see line 180)
Content-Language: en-US
To: Thomas Zimmermann <tzimmermann@suse.de>,
 Dan Carpenter <dan.carpenter@linaro.org>, oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, dri-devel@lists.freedesktop.org,
 oe-kbuild-all@lists.linux.dev
References: <ff8f09e7-d8c3-4b02-ae76-47dbac830cdb@kadam.mountain>
 <cfaa947b-0388-2464-6379-8b7ac2c57757@loongson.cn>
 <91d19fa9-9749-a741-b098-8bbf91ba23e7@suse.de>
From: suijingfeng <suijingfeng@loongson.cn>
In-Reply-To: <91d19fa9-9749-a741-b098-8bbf91ba23e7@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:AQAAf8DxJ834tKtkW+smAA--.43572S3
X-CM-SenderInfo: xvxlyxpqjiv03j6o00pqjv00gofq/
X-Coremail-Antispam: 1Uk129KBj93XoW3Gr1kCr43JFWrKw4DXrWfXrc_yoW3Gr1rpF
	W8t3W5Ary7K3WkAr4jyr42kFy5uw1rt3Wjkr1qvF1UKFyUtry2vr4DW34a9F43JrW8Cw43
	CF48XrsI9r17KrcCm3ZEXasCq-sJn29KB7ZKAUJUUUUr529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUB2b4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
	xVW8Jr0_Cr1UM2kKe7AKxVWUXVWUAwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07
	AIYIkI8VC2zVCFFI0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWU
	AVWUtwAv7VC2z280aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI4
	8JMxk0xIA0c2IEe2xFo4CEbIxvr21l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_
	Jr0_Gr1l4IxYO2xFxVAFwI0_Jw0_GFylx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8Gjc
	xK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIYrxkI7VAKI48JMIIF0xvE2Ix0
	cI8IcVAFwI0_JFI_Gr1lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8V
	AvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVW8JVWxJwCI42IY6I8E87Iv6xkF7I0E
	14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxU466zUUUUU

Hi,

On 2023/7/10 15:19, Thomas Zimmermann wrote:
> Hi
>
> Am 10.07.23 um 09:02 schrieb suijingfeng:
>> Hi,
>>
>>
>> Thanks for testing,
>>
>> What do you means about tell me this?
>>
>> I means that would you like to help fixing this warning?
>
> The code in drm_atomic_get_new_plane_state() dereferences the state 
> parameter.  Later in your function, you test for state to be non-NULL.
> That's what the warning is about.
>
> You should be able to silence this warning by removing the state test 
> from your function (and also delete that else branch). There should 
> always be an atomic state present and the atomic-check callbacks 
> should not be called without a state. If not, the driver most likely 
> failed to initialize correctly.
>

Yes, I will create a patch to fix this warning before tonight.

The driver works very well, it never print with kernel 'cmd drm.debug=0x02'.

I just feel interesting,  thanks.


> Best regards
> Thomas
>
>>
>> Or otherwise, I will fix this someday.
>>
>>
>> On 2023/7/10 14:29, Dan Carpenter wrote:
>>> tree: git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
>>> head:   8d1077cf2e43b15fefd76ebec2b71541eb27ef2c
>>> commit: f39db26c54281da6a785259498ca74b5e470476f [2/3] drm: Add kms 
>>> driver for loongson display controller
>>> config: i386-randconfig-m021-20230710 
>>> (https://download.01.org/0day-ci/archive/20230710/202307100423.rV7D05Uq-lkp@intel.com/config)
>>> compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
>>> reproduce: 
>>> (https://download.01.org/0day-ci/archive/20230710/202307100423.rV7D05Uq-lkp@intel.com/reproduce)
>>>
>>> If you fix the issue in a separate patch/commit (i.e. not just a new 
>>> version of
>>> the same patch/commit), kindly add following tags
>>> | Reported-by: kernel test robot <lkp@intel.com>
>>> | Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
>>> | Closes: 
>>> https://lore.kernel.org/r/202307100423.rV7D05Uq-lkp@intel.com/
>>>
>>> smatch warnings:
>>> drivers/gpu/drm/loongson/lsdc_plane.c:199 
>>> lsdc_cursor_plane_atomic_async_check() warn: variable dereferenced 
>>> before check 'state' (see line 180)
>>>
>>> vim +/state +199 drivers/gpu/drm/loongson/lsdc_plane.c
>>>
>>> f39db26c54281d Sui Jingfeng 2023-06-15  174  static int 
>>> lsdc_cursor_plane_atomic_async_check(struct drm_plane *plane,
>>> f39db26c54281d Sui Jingfeng 2023-06-15 175                          
>>> struct drm_atomic_state *state)
>>> f39db26c54281d Sui Jingfeng 2023-06-15  176  {
>>> f39db26c54281d Sui Jingfeng 2023-06-15  177      struct 
>>> drm_plane_state *new_state;
>>> f39db26c54281d Sui Jingfeng 2023-06-15  178      struct 
>>> drm_crtc_state *crtc_state;
>>> f39db26c54281d Sui Jingfeng 2023-06-15  179
>>> f39db26c54281d Sui Jingfeng 2023-06-15 @180      new_state = 
>>> drm_atomic_get_new_plane_state(state, plane);
>>> ^^^^^
>>> state is dereferenced inside this function
>>>
>>> f39db26c54281d Sui Jingfeng 2023-06-15  181
>>> f39db26c54281d Sui Jingfeng 2023-06-15  182      if (!plane->state 
>>> || !plane->state->fb) {
>>> f39db26c54281d Sui Jingfeng 2023-06-15  183 drm_dbg(plane->dev, "%s: 
>>> state is NULL\n", plane->name);
>>> f39db26c54281d Sui Jingfeng 2023-06-15  184          return -EINVAL;
>>> f39db26c54281d Sui Jingfeng 2023-06-15  185      }
>>> f39db26c54281d Sui Jingfeng 2023-06-15  186
>>> f39db26c54281d Sui Jingfeng 2023-06-15  187      if 
>>> (new_state->crtc_w != new_state->crtc_h) {
>>> f39db26c54281d Sui Jingfeng 2023-06-15  188 drm_dbg(plane->dev, 
>>> "unsupported cursor size: %ux%u\n",
>>> f39db26c54281d Sui Jingfeng 2023-06-15  189 new_state->crtc_w, 
>>> new_state->crtc_h);
>>> f39db26c54281d Sui Jingfeng 2023-06-15  190          return -EINVAL;
>>> f39db26c54281d Sui Jingfeng 2023-06-15  191      }
>>> f39db26c54281d Sui Jingfeng 2023-06-15  192
>>> f39db26c54281d Sui Jingfeng 2023-06-15  193      if 
>>> (new_state->crtc_w != 64 && new_state->crtc_w != 32) {
>>> f39db26c54281d Sui Jingfeng 2023-06-15  194 drm_dbg(plane->dev, 
>>> "unsupported cursor size: %ux%u\n",
>>> f39db26c54281d Sui Jingfeng 2023-06-15  195 new_state->crtc_w, 
>>> new_state->crtc_h);
>>> f39db26c54281d Sui Jingfeng 2023-06-15  196          return -EINVAL;
>>> f39db26c54281d Sui Jingfeng 2023-06-15  197      }
>>> f39db26c54281d Sui Jingfeng 2023-06-15  198
>>> f39db26c54281d Sui Jingfeng 2023-06-15 @199      if (state) {
>>>                                                      ^^^^^
>>> Checked too late
>>>
>>> f39db26c54281d Sui Jingfeng 2023-06-15  200 crtc_state = 
>>> drm_atomic_get_existing_crtc_state(state, new_state->crtc);
>>> f39db26c54281d Sui Jingfeng 2023-06-15  201      } else {
>>> f39db26c54281d Sui Jingfeng 2023-06-15  202 crtc_state = 
>>> plane->crtc->state;
>>> f39db26c54281d Sui Jingfeng 2023-06-15  203 drm_dbg(plane->dev, "%s: 
>>> atomic state is NULL\n", plane->name);
>>> f39db26c54281d Sui Jingfeng 2023-06-15  204      }
>>> f39db26c54281d Sui Jingfeng 2023-06-15  205
>>> f39db26c54281d Sui Jingfeng 2023-06-15  206      if 
>>> (!crtc_state->active)
>>> f39db26c54281d Sui Jingfeng 2023-06-15  207          return -EINVAL;
>>> f39db26c54281d Sui Jingfeng 2023-06-15  208
>>> f39db26c54281d Sui Jingfeng 2023-06-15  209      if 
>>> (plane->state->crtc != new_state->crtc ||
>>> f39db26c54281d Sui Jingfeng 2023-06-15  210 plane->state->src_w != 
>>> new_state->src_w ||
>>> f39db26c54281d Sui Jingfeng 2023-06-15  211 plane->state->src_h != 
>>> new_state->src_h ||
>>> f39db26c54281d Sui Jingfeng 2023-06-15  212 plane->state->crtc_w != 
>>> new_state->crtc_w ||
>>> f39db26c54281d Sui Jingfeng 2023-06-15  213 plane->state->crtc_h != 
>>> new_state->crtc_h)
>>> f39db26c54281d Sui Jingfeng 2023-06-15  214          return -EINVAL;
>>> f39db26c54281d Sui Jingfeng 2023-06-15  215
>>> f39db26c54281d Sui Jingfeng 2023-06-15  216      if 
>>> (new_state->visible != plane->state->visible)
>>> f39db26c54281d Sui Jingfeng 2023-06-15  217          return -EINVAL;
>>> f39db26c54281d Sui Jingfeng 2023-06-15  218
>>> f39db26c54281d Sui Jingfeng 2023-06-15  219      return 
>>> drm_atomic_helper_check_plane_state(plane->state,
>>> f39db26c54281d Sui Jingfeng 2023-06-15 
>>> 220                             crtc_state,
>>> f39db26c54281d Sui Jingfeng 2023-06-15 
>>> 221                             DRM_PLANE_NO_SCALING,
>>> f39db26c54281d Sui Jingfeng 2023-06-15 
>>> 222                             DRM_PLANE_NO_SCALING,
>>> f39db26c54281d Sui Jingfeng 2023-06-15 
>>> 223                             true, true);
>>> f39db26c54281d Sui Jingfeng 2023-06-15  224  }
>>>
>>
>

