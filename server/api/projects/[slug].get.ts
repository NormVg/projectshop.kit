import { serverSupabaseClient } from '#supabase/server'

export default defineEventHandler(async (event) => {
  const client = await serverSupabaseClient(event)
  const slug = getRouterParam(event, 'slug')

  if (!slug) {
    throw createError({
      statusCode: 400,
      statusMessage: 'Project slug is required',
    })
  }

  const { data, error } = await client
    .from('projects')
    .select('*')
    .eq('slug', slug)
    .eq('is_active', true)
    .single()

  if (error || !data) {
    throw createError({
      statusCode: 404,
      statusMessage: 'Project not found',
    })
  }

  return data
})
