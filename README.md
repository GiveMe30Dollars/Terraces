# Terraces
For those who want to see how I achieved the effect shown in the Not Your Usual Perlin Flow Field on Reddit. Copying this code directly is not advisable.

Requires ffmpeg and Video Export library to save videos. Program can be run without in Processing.
Don't bother looking for runtime controls; there aren't any.
Licensed under MIT license. Do whatever you want with this other than completely stealing it and passing it off as your own without modification.

Here's what you should expect when running the code:

https://user-images.githubusercontent.com/52666278/138008377-1ae9ee6f-72c9-4a97-b442-68eba10c1f13.mp4

The damping value can be changed to any value, depending on how much velocity the particles should retain. This example is with damping = 0.7

https://user-images.githubusercontent.com/52666278/138008562-256fd605-315f-46e4-a2c2-582031f04fd2.mp4

And for good measure, damping = 0.9

https://user-images.githubusercontent.com/52666278/138008588-fa9554b5-a34e-422c-8475-257fa33b31d2.mp4

Here's one where the damping value varies along the x-axis from 0 to 1. You can see the left pretty much follows the isolines of the noiseMap:

https://user-images.githubusercontent.com/52666278/138008643-441121f8-7cac-462d-9eed-9a78f92139da.mp4

